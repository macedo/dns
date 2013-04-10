class Record::CNAME < Record
  class << self
    def model_name
      Record.model_name
    end
  end

  attrs :hostname, :subdomain

  def to_text
    "\n#{self.subdomain}\tIN CNAME\t#{self.hostname}."
  end

  def name
    "CNAME"
  end
end
