# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Channel, type: :model do
  subject(:channel) { create(:channel) }

  it 'has the station' do
    expect(channel.station).to be_a(Station)
  end

  it 'has the subject' do
    expect(channel.subject).to be_a(Subject)
  end

  it 'has measurements' do
    expect(channel.measurements).to all(be_a(Measurement))
  end

  describe '.create' do
    context 'without code' do
      let(:station_with_code) { create(:station, code: 'STATION') }
      let(:subject_with_code) { create(:subject, code: 'SUBJECT') }

      subject do
        create(:channel, code: nil, station: station_with_code, subject: subject_with_code)
      end

      it 'sets station and subject codes joined  with a hyphen as the channel code' do
        expect(subject.code).to eq('STATION-SUBJECT')
      end
    end
  end
end
