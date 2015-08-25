ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/reporters' # requires the gem
require 'minitest/rails/capybara'
require 'capybara/rails'

class ActiveSupport::TestCase
	
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

  # Add more helper methods to be used by all tests here...
  def sample_file(filename = "sample_file.svg")
  	File.new("test/fixtures/#{filename}")
  end

end