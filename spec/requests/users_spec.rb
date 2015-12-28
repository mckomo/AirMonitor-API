require 'rails_helper'

RSpec.describe 'Users', :type => :request do

  describe 'GET /me' do

    context 'without an auth token' do

      before { get api_v1_current_user_path }

      it 'fails with the unauthorized status' do
        expect(response).to have_http_status(401)
      end

    end

    context 'with the auth token' do

      let(:user) { create(:user) }

      before { get api_v1_current_user_path, headers: { 'Authorization' => "Bearer #{RailsJwt::Token.for(user)}" } }

      it 'is successful' do
        expect(response).to have_http_status(200)
      end

    end

  end

  describe 'POST /me' do

      before { post api_v1_registration_path name: 'Mckomo', email: 'mckomo@example.com', password: 'PaSSw0RD' }

      it 'is successful with the 201 status' do
        expect(response).to have_http_status(201)
      end

  end

end
