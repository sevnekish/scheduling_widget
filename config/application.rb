require_relative 'boot'

require "active_model/railtie"
# And now the rest
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "active_job/railtie" # Only for Rails >= 4.2
require "action_cable/engine" # Only for Rails >= 5.0
require "sprockets/railtie"
require "rails/test_unit/railtie"

require './lib/client_portal_api'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SchedulingWidget
  class Application < Rails::Application
    config.load_defaults 6.0

    config.eager_load_paths << Rails.root.join('lib')

    config.x.default_clinician_id = ENV.fetch('CLINICIAN_ID','')
  end
end
