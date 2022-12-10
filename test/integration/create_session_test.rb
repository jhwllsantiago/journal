require "test_helper"

class CreateSessionTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should go to sign in form and create session" do
    get new_user_session_path
    assert_response :success
    post user_session_path, params: { user: { email: @user.email, password: @user.encrypted_password } }
    assert_response :success
  end
end