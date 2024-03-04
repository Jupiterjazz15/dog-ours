require "test_helper"

class UserTagsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_tags_create_url
    assert_response :success
  end

  test "should get destroy" do
    get user_tags_destroy_url
    assert_response :success
  end
end
