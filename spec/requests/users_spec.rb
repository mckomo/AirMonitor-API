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

  describe 'POST /me' do

    let(:user_params) { { user: { name: 'Mckomo', email: 'mckomo@example.com', password: 'PaSSw0RD' } } }

    before { post api_v1_registration_path, params: user_params }

    it 'is successful with the 201 status' do
      expect(response).to have_http_status(201)
    end

  end

end
