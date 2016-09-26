require 'rails_helper'

RSpec.describe JWT::Middleware, :type => :middleware do

  let(:app) { proc{[200,{},['Hello, world.']]} }
  let(:env) { env_with_bearer(token) }
  let(:secret) { Rails.application.secrets.jwt_secret }
  let(:payload) { Hash('data' => 'Some data') }

  subject { JWT::Middleware.new(app) }

  describe '.call' do

    before { subject.call(env) }

    context 'with a Bearer JWT token' do

      let(:token) { encode_jwt(secret) }

      context 'that is valid' do

        it 'appends the token payload to the request environment' do
          expect(env['jwt.token.payload']).to eq(payload)
        end

      end

      context 'that is invalid' do

        let(:token) { encode_jwt('invalid_secreet') }

        it 'appends an error to the request environment' do
          expect(env['jwt.token.error']).to be_a(StandardError)
        end

      end

    end
  end

  def encode_jwt(secret)
    JWT::Token.encode(payload, secret)
  end

  def env_with_bearer(token)
    Rack::MockRequest.env_for('http://example.com', { 'HTTP_AUTHORIZATION' => "Bearer #{token}" })
  end

end
