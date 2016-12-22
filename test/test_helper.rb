ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'devise/test_helpers'
require 'simplecov'

SimpleCov.start 'rails'

class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def get_cart(id)
    Cart.find session[:cart_id]
  end

  # Add more helper methods to be used by all tests here...
end
