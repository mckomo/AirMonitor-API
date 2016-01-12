require 'rails_helper'

RSpec.describe User, :type => :model do

  subject { create(:user) }

  it 'is inactive by default' do
    expect(subject.active?).to be(false)
  end

end
