FactoryGirl.define do

  factory :subject do

    code    'CODE10'
    symbol  'CODE<sub>10</sub>'
    name    'Subject name'
    unit    'unit'
    user

    transient do
      norm_count 3
    end

    after(:create) do |subject, evaluator|
      create_list(:norm, evaluator.norm_count, subject: subject)
    end

  end

end
