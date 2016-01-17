require 'rails_helper'

RSpec.describe 'Users', :type => :request do

  describe 'GET nonexistent endpoint' do

    before { get api_path + 'nonexistent-endpoint' }

    it 'responds with non found status code' do
      expect(response).to have_http_status(404)
    end

    it 'responds in the JSON format' do
      expect(response.content_type).to eq("application/json")
    end

    describe 'response body' do

      subject { JSON(response.body) }

      it 'contains error' do
        expect(subject['error']).not be_empty
      end

    end

  end

end
