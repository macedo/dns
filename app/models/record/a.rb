class Record::A < Record
  class << self
    def model_name
      Record.model_name
    end
  end

  attrs :hostname, :ip_address

  def to_text
    "\n#{self.hostname}\tIN A\t#{self.ip_address}"
  end

  def name
    "A"
  end
end
