class Record::SRV < Record
  attrs :hostname, :priority, :weight, :port, :target
end
