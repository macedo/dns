class Record < ActiveRecord::Base
  serialize :values, ActiveRecord::Coders::Hstore
  attr_accessible :values, :domain
  belongs_to :domain

  class << self
    def inherited(klass)
      klass.class_eval do
        define_singleton_method :model_name do
          Record.model_name
        end

        define_method :name do
          klass.name.split("::").last
        end
      end
    end

    def attrs(*args)
      args.each do |key|
        instance_eval do
          attr_accessible key

          define_method(key) do
            values && values[key.to_s]
          end

          define_method("#{key}=") do |value|
            self.values = (values || {}).merge(key.to_s => value)
          end
        end
      end
    end
  end
end
