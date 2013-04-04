class Record::MX < Record
  attrs :hostname, :priority

  def to_text
    "\n\tIN MX\t#{self.priority}\t#{self.hostname}."
  end
end
