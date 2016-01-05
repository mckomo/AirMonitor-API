require 'rails_helper'

RSpec.describe 'Users', :type => :request do

  describe 'GET /me' do

    context 'with the valid authorization token' do

      let(:user) { create(:user) }
      let(:token) { "Bearer #{RailsJwt::Token.for(user)}" }

      before { get api_v1_current_user_path, headers: { 'Authorization' => token } }

      it 'is successful' do
        expect(response).to have_http_status(200)
      end

    end

    context 'without an authorization token' do

      before { get api_v1_current_user_path }

      it 'fails with the Unauthorized status' do
        expect(response).to have_http_status(401)
      end

    end

  end

end
