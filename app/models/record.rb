class Record < ActiveRecord::Base
  NAMES = %w[A CNAME MX TXT SRV NS]
  attr_accessible :name, :value

  belongs_to :domain
end
