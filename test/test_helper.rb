ENV["RAILS_ENV"] ||= "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

class ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers
  # Setup fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def logged_in?
    !session["warden.user.user.key"].nil?
  end

  # Add more helper methods to be used by all tests here...
end
