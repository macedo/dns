class Record < ActiveRecord::Base
  attr_accessible :name, :value

  belongs_to :domain
end
