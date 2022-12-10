require "test_helper"

class CreateUserTest < ActionDispatch::IntegrationTest

  test "should go to new user form and create user" do
    get new_user_registration_path
    assert_response :success
    assert_difference("User.count", 1) do
      post user_registration_path, params: { user: { name: "John", email: "john@email.com", password: "password", password_confirmation: "password" } }
      assert_redirected_to root_url
    end
    follow_redirect!
    assert_redirected_to categories_url
    follow_redirect!
    assert_response :success
  end

  test "should go to new user form and fail to create user" do
    get new_user_registration_path
    assert_response :success
    assert_no_difference("User.count") do
      post user_registration_path, params: { user: { email: "john@email.com", password: "password", password_confirmation: "password" } }
    end
    assert_response :success
    assert_not_empty :notice
  end
end