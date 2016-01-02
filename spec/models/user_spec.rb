require 'rails_helper'

RSpec.describe User, :type => :model do

  subject { create(:user) }

  it 'is active by default' do
    expect(subject.active?).to be(true)
  end

end
