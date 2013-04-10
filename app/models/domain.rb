class Domain < ActiveRecord::Base
  attr_accessible :name
  has_many :records, dependent: :destroy

  before_create -> { self.serial = Time.now.to_i }

  def to_text
    "".tap do |text|
      text << "$TTL\t86400"
      text << "\n\n#{self.name}.\tIN\tSOA\tns1.#{self.name}. root.#{self.name}. ("
      text << "\n\t#{self.serial}\t; Serial"
      text << "\n\t10800\t; Refresh"
      text << "\n\t3600\t; Retry"
      text << "\n\t604800\t; Expire"
      text << "\n\t86400)\t; Minimum"
      text << "\n\n\n"
      self.records.each do |record|
        text << record.to_text
      end
    end
  end
end
