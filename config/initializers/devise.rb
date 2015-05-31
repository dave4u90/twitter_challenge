# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..72
  config.reset_password_within = 30.days
  config.sign_out_via = :delete
  config.omniauth :twitter, "GcBbGpGBae6SURh1jtYFyl77s", "j8qdZn3YSQVvMjvjRKvsj1IIdpLLYot6Hy2T9suWYjP3mHX5Fu"
end

Rails.application.config.to_prepare do
  Devise::SessionsController.layout "application"
end
