require 'rails_helper'

RSpec.describe Subject, :type => :model do

  subject(:subject) { create(:subject) }

  it 'has norms' do
    expect(subject.norms).not_to be_empty
  end

end
