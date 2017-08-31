require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module RailsTemplate
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.enable_dependency_loading = true
    config.autoload_paths << Rails.root.join('lib')
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :cs
    I18n.available_locales = [:en, :cs]

    config.active_job.queue_adapter = :sidekiq

    config.redis_settings = {
      url: ENV.fetch('REDIS_URL'),
      namespace: ENV.fetch('REDIS_NAMESPACE')
    }

    Sidekiq.configure_client do |config|
      config.redis = Rails.configuration.redis_settings
    end
  end
end
