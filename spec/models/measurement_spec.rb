require 'rails_helper'

RSpec.describe Measurement, :type => :model do

  subject(:measurement) { create(:measurement) }

  it 'has the subject' do
    expect(measurement.subject).not_to be_nil
  end

  it 'has norms' do
    expect(measurement.norms).not_to be_empty
  end

  describe '.save!' do

    let(:new_measurement) { build(:measurement, time: Time.zone.parse('2015-01-26 20:00')) }


    context 'when there was similar measurement more than 5 minutes earlier or later' do

      before { create(:measurement,
                      time: new_measurement.time + [-6, 6].sample.minutes,
                      station: new_measurement.station,
                      subject: new_measurement.subject ) }

      it 'succeeds' do
        new_measurement.save!
      end

    end

    context 'when there was similar measurement less than 5 minutes earlier or later' do

      before { create(:measurement,
                      time: new_measurement.time + rand(-5 .. 5).minutes,
                      station: new_measurement.station,
                      subject: new_measurement.subject ) }

      it 'fails' do
        expect{ new_measurement.save! }.to raise_error ActiveRecord::RecordInvalid
      end

    end

  end

end
