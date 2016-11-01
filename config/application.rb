require_relative 'boot'

require 'rails/all'
require 'rails/mongoid'



# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BibliotecaGutenbergEs
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    Mongoid.load!(File.expand_path('mongoid.yml', './config'))
    Mongoid.raise_not_found_error = false
    Mongoid::QueryCache.enabled = true
  end
end
