require 'rails_helper'

RSpec.describe "Measurements", :type => :request do

  describe "GET /stations/:id/measurements" do

    before { get station_measurements_path(1) }

    it 'is successful' do
      expect(response).to have_http_status(200)
    end

  end

end
