class Record::TXT < Record
  class << self
    def model_name
      Record.model_name
    end
  end

  attrs :txt_name, :text

  def to_text
    "\n#{self.txt_name}.\tIN TXT\t\"#{self.text}\""
  end

  def name
    "TXT"
  end
end
