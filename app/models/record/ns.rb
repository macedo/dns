class Record::NS < Record
  attrs :hostname

  validates_presence_of :hostname

  def to_text
    "\n\tIN NS\t#{self.hostname}."
  end
end
