# test/controllers/posts_controller_test.rb
require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @member = members(:one)
    sign_in @member
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
          title: "My Amazing Test Post Title Here",  # 30+ characters
          body: "This is a sufficiently long body for my test post that meets the minimum length requirement of 15 characters and provides enough content to be valid."  # Well over 15 characters
        }
      }
    end

    assert_redirected_to post_url(Post.last)
  end
end
