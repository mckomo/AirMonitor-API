require 'rails_helper'

RSpec.describe Measurement, :type => :model do

  subject(:measurement) { create(:measurement) }

  it 'has the subject' do
    expect(measurement.subject).not_to be_nil
  end

  it 'has norms' do
    expect(measurement.norms).not_to be_empty
  end

end
