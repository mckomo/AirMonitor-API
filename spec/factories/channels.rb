FactoryGirl.define do

  factory :channel do

    code    'CODE'
    station
    subject
    user

    factory :channel_with_measurements do

      transient do
        measurement_count 100
      end

      after(:create) do |channel, evaluator|
        create_list(:measurement, evaluator.measurement_count, channel: channel)
      end

    end

  end

end
