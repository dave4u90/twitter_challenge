ENV['RAILS_ENV'] ||= 'test'
require 'spec_helper'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!
ActionView::Template.register_template_handler(:slim, :source.to_proc)

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
    
  RSpec.configure do |config|
    config.include FactoryGirl::Syntax::Methods
    config.include Devise::TestHelpers, type: :controller
  end
end
