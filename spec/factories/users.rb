FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@mail.com"
  end

  factory :user do
    email
    password "password"
  end

end
