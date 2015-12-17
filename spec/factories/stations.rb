FactoryGirl.define do

  sequence :code do |n|
    "CODE#{n}"
  end

  factory :station do
    code
    name 'Station name'
    latitude { rand (50.0 .. 51) }
    longitude { rand (19.0 .. 20.0) }
    user
  end

end
