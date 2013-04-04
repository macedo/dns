class Record::CNAME < Record
  attrs :hostname, :subdomain

  def to_text
    "\n#{self.subdomain}\tIN CNAME\t#{self.hostname}."
  end
end
