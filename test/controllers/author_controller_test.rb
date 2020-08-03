require 'test_helper'

class AuthorControllerTest < ActionDispatch::IntegrationTest
  test "should get display_author" do
    get author_display_author_url
    assert_response :success
  end

end
