# frozen_string_literal: true
module Identifiable
  extend ActiveSupport::Concern

  def code
    self.class.code
  end

  included do
    def self.code
      @code || 500
    end

    def self.identify_by_code(code)
      @code = code
    end
  end
end
