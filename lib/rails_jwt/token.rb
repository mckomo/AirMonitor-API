module RailsJwt
  class Token

    attr_reader :header, :payload

    class << self

      def encode(payload)
        JWT.encode(payload, secret, algorithm)
      end

      def decode!(encoded_token)
        self.new JWT.decode(encoded_token, secret, true, algorithm: algorithm)
      end

      def for(user)
        encode(sub: user.id)
      end

      private

      def algorithm
        @algorithm ||= 'HS256'
      end

      def secret
        Rails.application.secrets.jwt_secret || begin
          raise RuntimeError, 'No JWT secret provided'
        end
      end

    end

    private

    def initialize(params)
      @payload, @header = params
    end

  end
end