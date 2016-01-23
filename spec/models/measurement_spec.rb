require 'rails_helper'

RSpec.describe Measurement, :type => :model do

  subject(:measurement) { create(:measurement) }

  it 'has the subject' do
    expect(measurement.subject).not_to be_nil
  end

  it 'has norms' do
    expect(measurement.norms).not_to be_empty
  end

  describe '.save' do

    let(:immediate_measurement) { build(:measurement, time: measurement.time + 4.minutes, station: measurement.station, subject: measurement.subject ) }

    it 'fails with less than a 5 minutes time interval ' do
      expect{ immediate_measurement.save! }.to raise_error ActiveRecord::RecordInvalid
    end

  end

end
