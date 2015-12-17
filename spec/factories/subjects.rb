FactoryGirl.define do

  factory :subject do

    code 'CODE'
    name 'Subject name'
    unit 'unit'

    transient do
      norm_count 3
    end

    after(:create) do |subject, evaluator|
      create_list(:norm, evaluator.norm_count, subject_code: subject.code)
    end

  end

end
