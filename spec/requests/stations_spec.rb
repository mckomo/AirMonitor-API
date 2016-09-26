require 'rails_helper'

RSpec.describe "Stations", :type => :request do

  describe 'GET /api/v1/stations' do

    let!(:stations) { create_list(:station, 5) }

    before { get api_v1_stations_path }

    it 'is successful' do
      expect(response).to have_http_status(200)
    end

    it 'responds in the JSON format' do

    end

    describe 'response body' do

      subject { JSON.parse(response.body) }

      it 'is an array' do
        expect(subject).to be_a(Array)
      end

      it 'contains stations' do
        skip
      end

      it 'has all stations' do
        expect(subject.count).to eq(stations.count)
      end

    end

  end

  describe 'GET /api/v1/stations/:code' do

    subject(:station) { create(:station) }

    context 'with the valid station code' do

      before { get api_v1_station_path(station.code) }

      it 'is successful' do
          expect(response).to have_http_status(200)
        end

      describe 'response body' do

        subject { JSON.parse(response.body) }

        it 'returns an object' do
          expect(JSON.parse(response.body)).to be_a(Hash)
        end

      end

    end

    context 'with an invalid station code' do

      before { get api_v1_station_path('invalid_code') }

      it 'fails with Not Found status code' do
        expect(response).to have_http_status(404)
      end

    end

  end

  describe 'GET /api/v1/stations/nearest' do

    let!(:east_station) { create(:station, code: 'EAST', latitude: 50.069308, longitude: 20.053492) }
    let!(:west_station) { create(:station, code: 'WEST', latitude: 50.081197, longitude: 19.895358) }
    let!(:center_station) { create(:station, code: 'CENTER', latitude: 50.057678, longitude: 19.926189) }
    let!(:south_station) { create(:station, code: 'SOUTH', latitude: 50.010575, longitude: 19.949189) }

    context 'with the location coordinates close to the existing station' do

      let(:near_center_location) { Hash(latitude: 50.050897, longitude: 19.920273) }

      before { get nearest_api_v1_stations_path(location: near_center_location) }

      it 'responds with See Other status' do
        expect(response).to have_http_status(303)
      end

      it 'returns an object' do
        expect(body).to be_a(Hash)
      end

      it 'returns the closest station' do
        expect(body['code']).to eq(center_station.code)
      end

      it 'returns Location header with URL to the closest station' do
        expect(response).to have_header('Location').with_value(api_v1_station_url(center_station.code))
      end

    end

    context 'with the location coordinates far from existing stations' do

      let(:other_city_location) { Hash(latitude: 52.13, longitude: 21.00) }

      before { get nearest_api_v1_stations_path(location: other_city_location) }

      it 'fails with Not Found status code' do
        expect(response).to have_http_status(404)
      end

    end

    context 'without a location coordinates' do

      before { get nearest_api_v1_stations_path('with no coordinates') }

      it 'fails with Bad Request status code' do
        expect(response).to have_http_status(400)
      end

    end

  end

end
