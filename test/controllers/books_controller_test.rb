require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    
    assert_difference "Book.count" do
      post books_path, 
        params: 
          {
            data: {
              type: :books, 
              attributes: {"title": "hello world"},
              relationships: {
                author: {
                  data: {type: :authors, id: authors(:one).id}
                }
              }
            },
            
          }.to_json,
        headers: {'Content-Type' => 'application/vnd.api+json'}
      assert_response :success
    end
  end
  test "create2" do
    
    assert_difference "Book.count" do
      post author_relationships_books_path(authors(:one).id), 
        params: 
          {
            data: {
              type: :books, 
              attributes: {"title": "hello world"},
              # relationships: {
              #   author: {
              #     links: {
              #       related: author_relationships_books_path(authors(:one).id)
              #     }
              #   }
              # },
              links: {
                self: books_path,
                related: author_relationships_books_path(authors(:one).id)
              },
            },
            links: {
              self: books_path,
              related: author_relationships_books_path(authors(:one).id)
            },
            included: {

            }

            
          }.to_json,
        headers: {'Content-Type' => 'application/vnd.api+json'}
      assert_response :success
    end
  end  
end
