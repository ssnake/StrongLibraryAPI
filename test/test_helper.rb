ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def setup
    super
    get login_create_url(email: users(:one).email, password: '123')
    j = JSON.parse(@response.body)
    @token = j['access']
    @refresh_token = j['refresh']
    @headers = {"Content-Type": "application/vnd.api+json", "Authorization": "Bearer #{@token}"}
  end
end