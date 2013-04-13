class Record < ActiveRecord::Base
  serialize :values, ActiveRecord::Coders::Hstore
  attr_accessible :values, :domain
  belongs_to :domain

  after_save    -> { self.domain.increment!(:serial) }
  after_destroy -> { self.domain.increment!(:serial) }

  class << self
    def attrs(*args)
      args.each do |key|
        instance_eval do
          attr_accessible key
          define_reader key
          define_writer key
        end
      end
    end

    def define_reader(attr)
      define_method(attr) do
        values && values[attr.to_s]
      end
    end

    def define_writer(attr)
      define_method("#{attr}=") do |value|
        self.values = (values || {}).merge(attr.to_s => value)
      end
    end
  end
end
