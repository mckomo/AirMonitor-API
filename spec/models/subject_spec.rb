require 'rails_helper'

RSpec.describe Subject, :type => :model do

  subject { create(:subject, norm_count: 3) }

  it 'has norms' do
    expect(subject.norms).not_to be_empty
  end

  it 'has the user' do
    expect(subject.user).to be_a(User)
  end

end
