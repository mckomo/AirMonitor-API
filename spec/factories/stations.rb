FactoryGirl.define do

  factory :station do

    code
    name 'Station name'
    latitude { rand (50.0 .. 51) }
    longitude { rand (19.0 .. 20.0) }
    user

    transient do
      channel_count 6
    end

    after(:create) do |station, evaluator|
      create_list(:channel, evaluator.channel_count, station: station)
    end

  end

end
