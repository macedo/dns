class Record::NS < Record
  attrs :hostname

  validates_presence_of :hostname
end
