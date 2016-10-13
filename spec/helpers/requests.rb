# frozen_string_literal: true
class Array
  def sort_desc_by(attribute)
    sort { |lhs, rhs| rhs[attribute] <=> lhs[attribute] }
  end
end

RSpec::Matchers.define :have_header do |header_name|
  match do |response|
    @actual = response.headers[header_name]

    values_match? @expected_value, @actual
  end

  chain :with_value do |value|
    @expected_value = value
  end

  failure_message do |actual|
    "expected that response would have header '#{header_name}' equal #{@expected_value}, not #{actual}"
  end
end

def auth_header
  Hash('Authorization' => "Bearer #{JWT::Token.for(create(:user))}")
end

def headers
  response.headers.to_h
end

def body
  JSON.parse(response.body)
end
