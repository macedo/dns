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
