require 'rails_helper'

RSpec.describe 'Channels', :type => :request do

  let(:channel_count) { 10 }
  let(:station) { create(:station, channel_count: channel_count ) }

  describe 'GET /api/v1/stations/:station_code/channels' do

    context 'with the valid station code' do

      before { get api_v1_station_channels_path(station.code) }

      it 'is successful' do
        expect(response).to have_http_status(200)
      end

      it 'returns an array' do
        expect(body).to be_a(Array)
      end

      it 'returns all station\'s channels' do
        expect(body.count).to eq(channel_count)
      end

    end

    context 'with an invalid channel code' do

      before { get api_v1_station_channels_path('invalid id') }

      it 'is fails with Not Found status code' do
        expect(response).to have_http_status(404)
      end

    end

  end

  describe 'GET /api/v1/channels/:code' do

    let!(:channel) { create(:channel) }

    context 'with the valid channel code' do

      before { get api_v1_channel_path(channel.code) }

      it 'is successful' do
        expect(response).to have_http_status(200)
      end

      it 'returns an object' do
        expect(body).to be_a(Object)
      end

    end

    context 'with an invalid channel code' do

      before { get api_v1_channels_path('invalid id') }

      it 'is fails with Not Found status code' do
        expect(response).to have_http_status(404)
      end

    end

  end

end
