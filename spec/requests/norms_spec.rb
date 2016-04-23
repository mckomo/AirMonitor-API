require 'rails_helper'

RSpec.describe 'Norms', :type => :request do

  describe 'GET /api/v1/norms' do

    let!(:norms) { create_list(:norm, 3, subject: create(:subject)) }

    before { get api_v1_norms_path }

    it 'is successful' do
      expect(response).to have_http_status(200)
    end

    it 'returns an array' do
      expect(body).to be_a(Array)
    end

    it 'returns all norms' do
      expect(body.count).to be(norms.count)
    end

  end

end
