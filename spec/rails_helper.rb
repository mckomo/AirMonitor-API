# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |spec|
    DatabaseCleaner.cleaning do
      spec.run
    end
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

module Alterable
  def alter(params)
    params.each { |k, v| self[k] += v }; self
  end
end

def headers
  response.headers
end

def body
  JSON.parse(response.body)
end

def copy(object)
  object.dup.extend(Alterable)
end

def token_header
  Hash('Authorization' => "Bearer #{JWT::Token.for(create(:user))}")
end