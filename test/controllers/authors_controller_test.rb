require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Author.count" do
      post authors_path, 
        params: {data: {type: :authors, attributes: {"first-name": "fn", "last-name": "ln"}}}.to_json,
        headers: {'Content-Type' => 'application/vnd.api+json'}
      assert_response :success
    end
  
  end
end
