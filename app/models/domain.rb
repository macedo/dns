class Domain < ActiveRecord::Base
  attr_accessible :dns1, :dns2, :name

  has_many :records
  accepts_nested_attributes_for :records
end
