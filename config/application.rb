require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Teaser
  class Application < Rails::Application

    config.assets.initialize_on_precompile = true
    config.assets.enabled = true

    config.assets.paths << Rails.root.join("app", "assets", "javascripts")
    config.assets.paths << Rails.root.join("app", "assets", "stylesheets")
    config.assets.paths << Rails.root.join("app", "assets", "images")

    config.assets.precompile += %w( application.css bootstrap_and_overrides.css )
    config.assets.precompile += %w( application.js bootstrap.js.coffee )
    config.assets.precompile += %w( *.css *.js )
    config.assets.precompile += %w( *.png *.gif *.jpg )
    config.assets.precompile += %w( *.ttf *.eot *.woff *.svg) # fonts
  end
end
