class Record::TXT < Record
  attrs :txt_name, :text

  def to_text
    "\n#{self.txt_name}.\tIN TXT\t\"#{self.text}\""
  end
end
