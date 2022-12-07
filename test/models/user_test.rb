require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @new_user = User.new(email: "test@test.com", name: "John", password: "12345678", password_confirmation: "12345678")
  end
  
  test "should save valid user" do
    assert @new_user.save, "valid user not saved"
  end

  test "should not save invalid user without name" do
    @new_user.name = nil
    assert_not @new_user.save, "invalid user saved without name"
    assert_not_empty @new_user.errors[:name], "no validation error for name"
  end

  test "should not save invalid user without email" do
    @new_user.email = nil
    assert_not @new_user.save, "invalid user saved without email"
    assert_not_empty @new_user.errors[:email], "no validation error for email"
  end

  test "should not save invalid user with duplicate email" do
    @new_user.email = @user.email
    assert_not @new_user.save, "invalid user with duplicate email saved"
    assert_not_empty @new_user.errors[:email], "no validation error for duplicate email"
  end

  test "should not save invalid user without password" do
    @new_user.password = nil
    assert_not @new_user.save, "invalid user saved without password"
    assert_not_empty @new_user.errors[:password], "no validation error for password"
  end

  test "should not save invalid user with mismatched password" do
    @new_user.password_confirmation = "123456"
    assert_not @new_user.save, "invalid user saved with mismatched password"
    assert_not_empty @new_user.errors[:password_confirmation], "no validation error for mismatched password"
  end

  test "should update user" do
    @user.update(email: "email@domain.com", name: "Jane")
    assert User.where(email: "email@domain.com", name: "Jane", id: @user.id).exists?, "user not updated"
  end

  test "should not update user with duplicate email" do
    @new_user.save
    assert_not @user.update(email: @new_user.email), "invalid user with duplicate email saved"
    assert_not_empty @user.errors[:email], "no validation error for duplicate email"
  end

  test "should delete user" do
    assert_difference("User.count", -1, "user count did not decrease by 1") do
      @user.destroy
    end

    assert_not User.exists?(@user.id),  "user not deleted"
  end
end
