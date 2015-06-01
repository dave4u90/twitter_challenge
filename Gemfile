source 'https://rubygems.org'

ruby '2.1.5'

gem 'slim-rails', '3.0.1'

group :development do
  group :framework do
    gem 'rails', '4.2.0'
  end

  group :user_management do
    gem 'devise', '3.5.1'
    gem 'bcrypt', '3.1.10'
    gem 'omniauth-twitter', '1.2.0'
    gem 'twitter', '5.14.0'
  end

  group :backend do
    gem 'mysql2', '0.3.18'
    gem 'pg'
  end

  group :asset_management do
    gem 'sass-rails', '5.0.3'
    gem 'less-rails', '2.7.0'
    gem 'uglifier', '2.7.1'
    gem 'coffee-rails', '4.1.0'
    gem 'therubyracer', '0.12.2', platforms: :ruby
    gem 'jquery-rails', '4.0.3'
    gem 'turbolinks', '2.5.3'
    gem 'jbuilder', '2.2.16'
    gem 'sdoc', '0.4.1', group: :doc
    gem 'twitter-bootstrap-rails', '3.2.0'
    gem 'select2-rails', '3.5.9.3'
  end

  group :servers do
    gem 'unicorn', '4.9.0'
  end

  group :deployment do
    gem 'capistrano-rails', '1.1.3'
  end

  group :test do
    gem 'rspec-rails', '3.2.1'
    gem 'factory_girl_rails', '4.5.0'
    gem 'faker', '1.4.3'
    gem 'byebug', '5.0.0'
    gem 'web-console', '2.1.2'
    gem 'spring', '1.3.6'
  end
end
