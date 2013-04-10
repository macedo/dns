FactoryGirl.define do
  factory :domain do
    name 'johndoe.com'
  end

  factory :invalid_domain, class: Domain do
  end
end
