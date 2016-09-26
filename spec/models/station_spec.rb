require 'rails_helper'

RSpec.describe Station, :type => :model do

  subject(:station) { create(:station) }

  it 'has the user' do
    expect(station.user).to be_a(User)
  end

end
