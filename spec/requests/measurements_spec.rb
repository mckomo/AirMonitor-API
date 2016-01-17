require 'rails_helper'

RSpec.describe "Measurements", :type => :request do

  let(:station) { create(:station) }
  let(:body) { JSON.parse(response.body) }

  describe 'GET /api/v1/stations/:station_code/measurements' do


    context 'with the valid station id' do

      let!(:measurements) { create_list(:measurement, 5, station: station) }

      before { get api_v1_station_measurements_path(station.code) }

      it 'is successful' do
        expect(response).to have_http_status(200)
      end

      it 'returns an array' do
        expect(body).to be_a(Array)
      end

      it 'returns all station\'s measurements' do
        expect(body.count).to eq(measurements.count)
      end

    end

    context 'with an invalid staion id' do

      before { get api_v1_station_measurements_path('invalid id') }

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

  describe 'POST /api/v1/stations/:station_code/measurements' do

    context 'with the valid authentication token' do

      let(:user) { create(:user) }
      let(:token) { "Bearer #{RailsJwt::Token.for(user)}" }
      let(:subject) { create(:subject) }
      let(:measurement) { { measurement: { value: 100.0, time: Time.now, source: 'Test source', subject_id: subject.id} } }

      before { post api_v1_station_measurements_path(station.code), params: measurement, headers: { 'Authorization' => token } }

      it 'is successful with Created status code' do
        expect(response).to have_http_status(201)
      end

    end

    context 'without an authentication token' do

      before { post api_v1_station_measurements_path(station.id) }

      it 'is successful with Created status code' do
        expect(response).to have_http_status(401)
      end

    end

  end

end
