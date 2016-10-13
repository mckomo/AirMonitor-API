# frozen_string_literal: true
FactoryGirl.define do
  sequence :code do |n|
    "CODE#{n}"
  end

  sequence :symbol do |n|
    "CODE<sub>#{n}</sub>"
  end

  sequence :time do |n|
    Time.now - n.hours
  end
end
