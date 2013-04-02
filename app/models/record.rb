class Record < ActiveRecord::Base
  serialize :values, ActiveRecord::Coders::Hstore
  attr_accessible :name, :values, :domain
  belongs_to :domain

  class << self
    def inherited(klass)
      klass_name = klass.name.split("::").last
      klass.instance_eval <<-RUBY, __FILE__, __LINE__
        after_initialize do
          self.name = "#{klass_name}" unless self.name
        end

        def self.all
          where(name: "#{klass_name}")
        end
      RUBY
    end

    def attrs(*args)
      args.each do |key|
        instance_eval <<-RUBY, __FILE__, __LINE__
        attr_accessible key

        define_method(key) do
          values && values[key]
        end

        define_method("#{key}=") do |value|
          self.values = (values || {}).merge(key => value)
        end
        RUBY
      end
    end
  end

  def method_missing(id, *args, &block)
    if values.has_key?(id.to_s)
      values.fetch(id.to_s)
    else
      super
    end
  end
end
