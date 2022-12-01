require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  
  test "should not save category" do
    category = Category.new
    assert_not category.save, "category saved without name and details"
    category.details = "details"
    assert_not category.save, "category saved without name"
  end

  test "should save category" do
    category = Category.new
    category.name = "name"
    assert category.save, "category not saved"
    category.details = "details"
    assert category.save, "category not saved"
  end

  test "should update category" do
    category = Category.new
    category.name = "name"
    category.details = "details"
    category.save
    category.update(name: "asdf")
    assert Category.where(name: "asdf"), "category not updated"
  end

  test "should delete category" do
    category = Category.new
    category.name = "name"
    assert category.destroy, "category not deleted"
  end
end
