class Record::NS < Record
  class << self
    def model_name
      "Record"
    end
  end

  attrs :hostname

  def to_text
    "\n\tIN NS\t#{self.hostname}."
  end

  def name
    "NS"
  end
end
