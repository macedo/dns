class Record::SRV < Record
  attrs :hostname, :priority, :weight, :port, :target

  def to_text
    "\n_http_.tcp.#{self.hostname}.\tIN SRV\t#{self.priority}\t#{self.weight}\t#{self.port}\t#{self.target}."
  end
end
