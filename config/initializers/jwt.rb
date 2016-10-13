# frozen_string_literal: true
require 'jwt/middleware'

Rails.application.config.middleware.use JWT::Middleware
