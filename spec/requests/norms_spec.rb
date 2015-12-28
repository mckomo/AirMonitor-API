require 'rails_helper'

RSpec.describe 'Norms', :type => :request do

  describe 'GET /api/v1/subjects' do

    let!(:norms) { create_list(:norm, 3, subject: create(:subject, norm_count: 0)) }

    before { get api_v1_norms_path }

    it 'is successful' do
      expect(response).to have_http_status(200)
    end

    it 'returns an array' do
      expect(JSON.parse(response.body)).to be_a(Array)
    end

    it 'contains all norms' do
      expect(JSON.parse(response.body).count).to be(norms.count)
    end

  end

end
