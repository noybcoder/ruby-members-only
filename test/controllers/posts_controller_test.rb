require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers  # Add this line

  setup do
    @member = members(:one)  # Get a member from fixtures
    sign_in @member  # Devise helper method
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count", 1) do
      post posts_url, params: {
        post: {
          title: "Test Post",
          body: "This is a test post body"
        }
      }
    end

    assert_redirected_to post_url(Post.last)
  end
end
