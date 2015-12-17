require 'rails_helper'

RSpec.describe Station, :type => :model do

  subject(:station) { create(:station) }

  it 'has the user' do
    expect(station.user).not_to be_nil
  end

end
