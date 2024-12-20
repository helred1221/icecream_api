require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module IcecreamApi
  class Application < Rails::Application

    config.load_defaults 7.0

    config.api_only = true
    config.autoload_paths << "#{config.root}/app/services"
    config.autoload_paths << "#{config.root}/app/filters"
  end
end
