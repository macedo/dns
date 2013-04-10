FactoryGirl.define do
  factory :a_record, class: Record::A do
    hostname 'johndoe.com'
    ip_address '192.168.1.1'
  end
end
