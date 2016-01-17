require 'rails_helper'

RSpec.describe "Stations", :type => :request do

  describe 'GET /api/v1/stations' do

    let!(:stations) { create_list(:station, 5) }

    before { get api_v1_stations_path }

    it 'is successful' do
      expect(response).to have_http_status(200)
    end

    it 'returns an array' do
      expect(JSON.parse(response.body)).to be_a(Array)
    end

    it 'contains all stations' do
      expect(JSON.parse(response.body).count).to be(stations.count)
    end

  end

  describe 'GET /api/v1/stations/:code' do

    subject(:station) { create(:station) }

    before { get api_v1_station_path(station.code) }

    it 'is successful' do
      expect(response).to have_http_status(200)
    end

    it 'returns an object' do
      expect(JSON.parse(response.body)).to be_a(Hash)
    end

    context 'with invalid id' do

      before { get api_v1_station_path('invalid_id') }

      it 'fails with Not Found status code' do
        expect(response).to have_http_status(404)
      end

    end

  end

end
