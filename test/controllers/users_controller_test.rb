require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @new_user = { email: "new@email.com", name: "John", password: "password", password_confirmation: "password" }
  end

  test "should get new registration" do
    get new_user_registration_url
    assert_response :success
  end

  test "should create user" do
    assert_difference("User.count") do
      post user_registration_url, params: { user: @new_user }
    end

    assert_redirected_to root_url
  end

  test "should not create invalid user" do
    @new_user[:email] = nil
    assert_no_difference("User.count") do
      post user_registration_url, params: { user: @new_user }
    end
  end

  test "should not create duplicate user" do
    @new_user[:email] = @user.email
    assert_no_difference("User.count") do
      post user_registration_url, params: { user: @new_user }
    end
  end

  test "should get edit" do
    sign_in @user
    get edit_user_registration_url(@user)
    assert_response :success
  end

  test "should not get edit" do
    get edit_user_registration_url(@user)
    assert_response :unauthorized
  end

  test "should update user" do
    post user_registration_url, params: { user: @new_user }
    post user_session_url, params: { user: { email: @new_user[:email], password: @new_user[:password] } }
    patch user_registration_url, params: { user: { name: "name", current_password: @new_user[:password] } }
    assert_redirected_to root_url
  end

  test "should get new session" do
    get new_user_session_url
    assert_response :success
  end

  test "should create and destroy session" do
    post user_registration_url, params: { user: @new_user }
    post user_session_url, params: { user: { email: @new_user[:email], password: @new_user[:password] } }
    assert_redirected_to root_url
    assert controller.current_user

    delete destroy_user_session_url(controller.current_user)
    assert_not controller.current_user
  end
end
