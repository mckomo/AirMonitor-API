require 'rails_helper'

RSpec.describe "Measurements", :type => :request do
  describe "GET /measurements" do
    it "works! (now write some real specs)" do
      get measurements_path
      expect(response).to have_http_status(200)
    end
  end
end
