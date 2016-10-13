# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Subject, type: :model do
  subject { create(:norm, subject: create(:subject)) }

  it 'has the subject' do
    expect(subject.subject).to be_a(Subject)
  end

  it 'has the user' do
    expect(subject.user).to be_a(User)
  end
end
