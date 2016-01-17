require File.expand_path('../boot', __FILE__)

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AirMonitor
  class Application < Rails::Application

    config.eager_load_paths << Rails.root.join('lib')
    config.i18n.default_locale = :pl
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end

  end
end
