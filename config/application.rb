require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module WeatherApp

  class Application < Rails::Application

    config.load_defaults 8.0

    config.autoload_paths.delete("#{config.root}/app/services")

  end

end