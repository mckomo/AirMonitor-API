# frozen_string_literal: true
FactoryGirl.define do
  factory :subject do
    code
    symbol
    name    'Subject name'
    unit    'unit'
    user

    transient do
      norm_count 0
    end

    after(:create) do |subject, evaluator|
      create_list(:norm, evaluator.norm_count, subject: subject)
    end
  end
end
