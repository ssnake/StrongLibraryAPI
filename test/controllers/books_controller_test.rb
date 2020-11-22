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
            }
          }.to_json,
        headers: @headers  

      assert_response :success
    end
  end

  test "get all books" do
    get books_path, headers: @headers
    assert_response :success
    j = JSON.parse @response.body
    assert_equal books.count, j['data'].length
  end

  test "get books for first author" do
    get author_relationships_books_path(authors(:one).id), headers: @headers
    assert_response :success
    j = JSON.parse @response.body
    assert_equal authors(:one).books.length, j['data'].length
  end

  test "update book" do
    old_title = books(:one).title
    patch book_path(books(:one).id),
      params: {
        data: {
          type: :books,
          id: books(:one).id,
          attributes: {title: "changed" }
        }
      }.to_json,
      headers: @headers

    assert_response :success
    assert_not_equal old_title, books(:one).reload.title
    assert_equal "changed", books(:one).title
  end

  test "delete book" do
    assert_difference "Book.count", -1 do
      delete book_path(books(:one).id), headers: @headers
      assert_response :success
    end

  end
end
