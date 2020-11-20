require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  def test_full_name
    context = {}
    contact_resource = AuthorResource.new(Author.new(first_name: "Joe", last_name: "Smith"), context)
    assert_equal "Joe", contact_resource.first_name
    assert_equal "Smith", contact_resource.last_name
  end
end
