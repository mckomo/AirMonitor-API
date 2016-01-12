FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@mail.com"
  end

  factory :user do

    name 'User Name'
    email
    password 'password'

    factory :active_user do

      after(:create) do |user|
        user.confirm
      end

    end

  end

end
