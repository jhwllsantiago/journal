require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should get about" do
    get about_url
    assert_response :success
  end

  test "should redirect to categories" do
    sign_in users(:one)
    get root_url
    assert_response :redirect
    assert_redirected_to categories_url
  end
end
