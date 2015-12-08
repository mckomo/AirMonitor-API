require 'rails_helper'

RSpec.describe "Readings", :type => :request do
  describe "GET /readings" do
    it "works! (now write some real specs)" do
      get readings_path
      expect(response).to have_http_status(200)
    end
  end
end
