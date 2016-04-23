FactoryGirl.define do

  factory :channel do

    code    'CODE'
    station
    subject
    user

    transient do
      measurement_count 0
    end

    after(:create) do |channel, evaluator|
      create_list(:measurement, evaluator.measurement_count, channel: channel)
    end

  end

end
