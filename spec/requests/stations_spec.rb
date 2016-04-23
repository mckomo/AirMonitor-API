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

end
