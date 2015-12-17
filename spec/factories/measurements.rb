FactoryGirl.define do

  factory :measurement do
    value 100.0
    source "Source name"
    station
    subject { create(:subject) }
    user
    time { Time.now }
  end

end
