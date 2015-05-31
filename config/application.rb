require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'devise'
require 'omniauth'
require 'omniauth-twitter'
require 'twitter'

Bundler.require(*Rails.groups)

module TwitterAssignment
  class Application < Rails::Application
    config.serve_static_files = true
    config.assets.initialize_on_precompile = false
    config.active_record.raise_in_transactional_callbacks = true
   
    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end

  end
end
