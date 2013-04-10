class Record::MX < Record
  class << self
    def model_name
      Record.model_name
    end
  end

  attrs :hostname, :priority

  def to_text
    "\n\tIN MX\t#{self.priority}\t#{self.hostname}."
  end

  def name
    "MX"
  end
end
