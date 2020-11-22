require 'test_helper'

class AuthorsControllerTest < ActionDispatch::IntegrationTest
	def setup
		get login_create_url(email: users(:one).email, password: '123')
    @token = JSON.parse(@response.body)['access']
    @headers = {"Content-Type": "application/vnd.api+json", "Authorization": "Bearer #{@token}"}
	end
  test "create" do
    assert_difference "Author.count" do
      post authors_path, 
        params: {data: {type: :authors, attributes: {"first-name": "fn", "last-name": "ln"}}}.to_json,
        headers: @headers
      assert_response :success
    end
  end

  test "get all authors" do
  	get authors_path, headers: @headers
  	assert_response :success
  	j = JSON.parse @response.body
  	assert_equal authors.length, j['data'].length
  end

  test "update first author" do
  	old_first_name = authors(:one).first_name
  	put author_path(authors(:one).id), 
  		params: {
	  		data: {
	  			type: :authors,
	  			id: authors(:one).id,
	  			attributes: {"first-name": "changed"}
	  		}
  		}.to_json,
  		headers: @headers
  	
  	assert_response :success
  	
  	j = JSON.parse @response.body
  	
  	assert_not_equal old_first_name, authors(:one).reload.first_name
  	assert_equal "changed", authors(:one).first_name
  end
  test "detele authors" do
  	assert_difference "Author.count", -1 do
  		assert_difference "Book.count", -authors(:one).books.count do
  			delete author_path(authors(:one).id), headers: @headers
  		end
  	end
  end
end
