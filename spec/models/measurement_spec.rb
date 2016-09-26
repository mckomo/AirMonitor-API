require 'rails_helper'

RSpec.describe Measurement, :type => :model do

  subject(:measurement) { create(:measurement) }

  it 'has the channel' do
    expect(measurement.channel).to be_a(Channel)
  end

  it 'has the user' do
    expect(measurement.user).to be_a(User)
  end

  describe '.save!' do

    context 'when a time span between measurements is equal to 5 minutes' do

      let(:new_measurement) { copy(measurement).alter(time: +5.minutes) }

      it 'fails' do
        expect { new_measurement.save! }.to raise_error ActiveRecord::RecordInvalid
      end

    end

    context 'when a time span between measurements is greater than 5 minutes' do

      let(:new_measurement) { copy(measurement).alter(time: +6.minutes) }

      it 'succeeds' do
        new_measurement.save!
      end

    end

  end

end
