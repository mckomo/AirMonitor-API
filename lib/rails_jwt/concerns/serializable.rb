module RailsJwt
  module Serializable

    extend ActiveSupport::Concern
    include ActiveModel::Serialization

    def self.included(klass)
      klass.extend ActiveModel::Naming
    end

  end
end