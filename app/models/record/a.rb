class Record::A < Record
  attrs :hostname, :ip_address

  def to_text
    "\n#{self.hostname}\tIN A\t#{self.ip_address}"
  end
end
