require 'rails_helper'

RSpec.describe RailsJwt::Middleware, :type => :middleware do

  let(:url) { 'http://example.com' }
  let(:app) { proc{[200,{},['Hello, world.']]} }
  let(:secret) { Rails.application.secrets.jwt_secret }

  subject { RailsJwt::Middleware.new(app) }

  describe '.call' do

    context 'with a Bearer token in the Authorization header' do

      let(:env) { env_for(url, { 'HTTP_AUTHORIZATION' => "Bearer #{token}" }) }
      let(:token) { encode_jwt_with(secret) }

      context 'that is the valid JWT token' do

        it 'appends the JWT token payload to the request environment' do
          subject.call(env)
          expect(env['jwt.token.payload']).to eq(decode_jwt(token).first)
        end

      end

      context 'that is the false JWT token' do

        let(:token) { encode_jwt_with('invalid_secreet') }

        it 'appends the VerificationError to the request environment' do
          subject.call(env)
          expect(env['jwt.token.error']).to be_a(JWT::VerificationError)
        end

      end

    end

  end

  def encode_jwt_with(secret)
    JWT.encode({ data: 'test' }, secret || '', 'HS256')
  end

  def decode_jwt(token)
    JWT.decode(token, secret, true, { :algorithm => 'HS256' })
  end

  def env_for(url, opts = {})
    Rack::MockRequest.env_for(url, opts)
  end

end
