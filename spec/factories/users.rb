FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@mail.com"
  end

  factory :user do
    name 'User Name'
    email
    password "password"
  end

end
