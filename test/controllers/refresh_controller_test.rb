require 'test_helper'

class RefreshControllerTest < ActionDispatch::IntegrationTest
  test "should refresh token" do
    get refresh_create_url, headers: @headers.merge({"X-Refresh-Token": @refresh_token})
    assert_response :success

    new_token = JSON.parse(@response.body)["access"]
    
    get books_path, headers: @headers
    assert_response :unauthorized
    
    @headers["Authorization"] = "Bearer #{new_token}"
		get books_path, headers: @headers
    assert_response :success

  end

end
