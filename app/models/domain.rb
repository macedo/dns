class Domain < ActiveRecord::Base
  attr_accessible :name
  has_many :records, dependent: :destroy

  before_create -> { self.serial = Time.now.to_i }

  def to_text
    update_serial
    "".tap do |text|
      text << "$TTL\t86400"
      text << "\n\n#{self.name}.\tIN\tSOA\tns1.#{self.name}. root.#{self.name}. ("
      text << "\n\t\t#{self.serial}\t; Serial"
      text << "\n\t\t10800\t; Refresh"
      text << "\n\t\t3600\t; Retry"
      text << "\n\t\t604800\t; Expire"
      text << "\n\t\t86400)\t; Minimum"
    end
  end

  private
  def update_serial
    increment! :serial
  end
end
