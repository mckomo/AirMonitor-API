module JWT
  class Middleware

    def initialize(app)
      @app = app
    end

    def call(env)

      encoded_token = extract_bearer(env['HTTP_AUTHORIZATION'])

      begin
        env['jwt.token.payload'] = Token
                                       .decode!(encoded_token)
                                       .payload
      rescue JWT::DecodeError, JWT::VerificationError => error
        env['jwt.token.error'] = error
      end

      @app.call(env)

    end

    private

    def extract_bearer(token_candidate)
      bearer?(token_candidate) ? token_candidate.split(' ').last : ''
    end

    def bearer?(token)
      token.try(:starts_with?, 'Bearer')
    end

  end
end