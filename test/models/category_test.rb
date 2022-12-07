require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = categories(:one)
    @new_category = Category.new(name: "name", details: "details")
    @new_category.user = users(:one)
  end
  
  test "should save valid category" do
    assert @new_category.save, "valid category not saved"
    @category.details = nil
    assert @new_category.save, "valid category not saved without details"
  end

  test "should not save invalid category with no name" do
    @new_category.name = nil
    assert_not @new_category.save, "invalid category saved without name"
    assert_not_empty @new_category.errors[:name], "no validation error for name"
  end

  test "should not save invalid category with no user" do
    @new_category.user = nil
    assert_not @new_category.save, "invalid category saved without user"
    assert_not_empty @new_category.errors[:user], "no validation error for user"
  end

  test "should update category" do
    @category.update(name: "update name", details: "update details")
    assert Category.where(name: "update name", details: "update details", id: @category.id).exists?, "category not updated"
  end

  test "should delete category" do
    assert_difference("Category.count", -1, "category count did not decrease by 1") do
      @category.destroy
    end

    assert_not Category.exists?(@category.id),  "category not deleted"
  end
end
