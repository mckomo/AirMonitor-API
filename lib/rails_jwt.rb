require_relative 'rails_jwt/concerns/authenticable'
require_relative 'rails_jwt/concerns/serializable'
require_relative 'rails_jwt/errors/unauthorized_access_error'
require_relative 'rails_jwt/middleware'
require_relative 'rails_jwt/token'

module RailsJwt
  VERSION = ['0', '0', '1'].join('.')
end