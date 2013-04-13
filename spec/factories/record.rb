FactoryGirl.define do
  factory :a_record, class: Record::A do
    hostname 'johndoe.com'
    ip_address '192.168.1.1'
  end

  factory :ns_record, class: Record::NS do
  end

  factory :cname_record, class: Record::CNAME do
  end

  factory :mx_record, class: Record::MX do
  end

  factory :txt_record, class: Record::TXT do
  end

  factory :srv_record, class: Record::SRV do
  end
end
