FactoryGirl.define do

  factory :measurement do
    value 100.0
    source 'Source name'
    channel
    user
    time
  end

end
