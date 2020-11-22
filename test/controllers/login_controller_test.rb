require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should create tokens" do
    get login_create_url(email: users(:one).email, password: '123')
    assert_response :success
    
    j = JSON.parse(@response.body)
    assert j["access"].present?
    assert j["refresh"].present?
  end
  test "should reject unauthenticated user" do
  	get login_create_url(email: users(:one).email)
    assert_response :unauthorized
  end

test "should reject unknown  user" do
  	get login_create_url(email: 'hello@example.com')
    assert_response :unauthorized
  end

end
