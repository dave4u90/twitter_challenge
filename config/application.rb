require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'devise'
require 'omniauth'
require 'omniauth-twitter'
require 'twitter'

Bundler.require(*Rails.groups)

module TwitterAssignment
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
   
    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end

    config.middleware.use OmniAuth::Builder do
      provider :twitter, "GcBbGpGBae6SURh1jtYFyl77s", "j8qdZn3YSQVvMjvjRKvsj1IIdpLLYot6Hy2T9suWYjP3mHX5Fu"  
    end
  end
end
