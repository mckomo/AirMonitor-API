require 'rails_helper'

RSpec.describe 'Auth', :type => :request do

  describe 'POST /api/v1/auth/tokens' do

    let(:user) { create(:active_user) }

    before { post api_v1_auth_tokens_path auth }

    context 'with valid auth params' do

      let(:auth) { { auth: { email: user.email, password: user.password } } }
      let(:body) { JSON.parse(response.body) }

      it 'is successful with the Created status code' do
        expect(response).to have_http_status(201)
      end

      it 'returns the access token' do
        expect(body['token']).not_to be_empty
      end

    end

    context 'with invalid auth data' do

      let(:auth) { { auth: {email: user.email, password: 'invalid password' } } }

      it 'responds with the Unauthorized status code' do
        expect(response).to have_http_status(401)
      end

    end

  end

end