require 'rails_helper'

RSpec.describe "Stations", :type => :request do

  describe 'GET /stations' do

    let!(:stations) { create_list(:station, 5) }

    before { get stations_path }

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

  describe 'GET /stations/:id' do

    subject(:station) { create(:station) }

    before { get station_path(station.id) }

    it 'is successful' do
      expect(response).to have_http_status(200)
    end

    it 'returns an object' do
      expect(JSON.parse(response.body)).to be_a(Hash)
    end

    context 'with invalid id' do

      it 'fails with RecordNotFound' do
        expect { get station_path('invalid_id') }.to raise_error(ActiveRecord::RecordNotFound)
      end

    end

  end

end
