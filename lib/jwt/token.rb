module JWT

  ALGORITHM = 'HS256'

  class Token

    attr_reader :header, :payload

    private

    def initialize(params)
      @payload, @header = params
    end

    class << self

      def encode(payload, secret = rails_secret)
        JWT.encode(payload, secret, ALGORITHM)
      end

      def decode!(token, secret = rails_secret)
        self.new JWT.decode(token, secret, true, algorithm: ALGORITHM)
      end

      def for(user)
        encode(sub: user.id)
      end

      private

      def rails_secret
        Rails.application.secrets.jwt_secret || begin
          raise RuntimeError, 'No JWT secret provided'
        end
      end

    end

  end

end