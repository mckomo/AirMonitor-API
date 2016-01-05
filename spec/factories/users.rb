FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@mail.com"
  end

  factory :user do

    name 'User Name'
    email
    password 'password'

    factory :active_user do
      status :active
    end

  end

end
