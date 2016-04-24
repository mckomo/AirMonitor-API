require 'rails_helper'

RSpec.describe 'Measurements', :type => :request do

  let!(:channel) { create(:channel) }

  describe 'GET /api/v1/channels/:code/measurements' do

    context 'with the valid channel code' do

      before { get api_v1_channel_measurements_path(channel.code) }

      it 'is successful' do
        expect(response).to have_http_status(200)
      end

      it 'returns an array' do
        expect(body).to be_a(Array)
      end

      it 'returns all channel\'s measurements' do
        expect(body.count).to eq(channel.measurements.count)
      end

    end

    context 'with an invalid channel code' do

      before { get api_v1_channel_measurements_path('invalid id') }

      it 'is fails with Not Found status code' do
        expect(response).to have_http_status(404)
      end

    end

  end

  describe 'GET /api/v1/measurements/:id' do

    subject(:measurement) { create(:measurement) }

    before { get api_v1_measurement_path(measurement.id) }

    it 'is successful' do
      expect(response).to have_http_status(200)
    end

    it 'is returns an object' do
      expect(body).to be_a(Hash)
    end

  end

  describe 'POST /api/v1/channel/:code/measurements' do

    let(:params) { Hash(measurement: measurement_params) }

    context 'with the valid authentication token' do

      before { post api_v1_channel_measurements_path(channel.code),
                    params: params,
                    headers: token_header }


      it 'responds with Created status code' do
        expect(response).to have_http_status(201)
      end

      it 'returns Location header with URL to the created measurement' do
        expect(response).to have_header('Location').with_value(api_v1_measurement_url(Measurement.last))
      end

    end

    context 'without an authentication token' do

      before { post api_v1_channel_measurements_path(channel.code, params: params) }

      it 'is successful with Unauthorized status code' do
        expect(response).to have_http_status(401)
      end

    end

  end

end

def measurement_params
  {
      value: 100.0,
      time: Time.now,
      source: 'Test source'
  }
end
