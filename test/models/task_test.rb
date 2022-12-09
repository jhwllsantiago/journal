require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @task = tasks(:one)
    @new_task = Task.new(title: "title", completed: false, deadline:"2022-12-10")
    @new_task.category = categories(:one)
    @new_task.user = users(:one)
  end

  test "should save task" do
    assert @new_task.save, "task not saved"
  end

  test "should not save task without category" do
    @new_task.category = nil
    assert_not @new_task.save, "task without category saved"
  end

  test "should not save task without user" do
    @new_task.user = nil
    assert_not @new_task.save, "task without user saved"
  end

  test "should update task" do
    @task.update(title: "update title", completed: true, deadline: "2022-12-12")
    assert Task.where(title: "update title", completed: true, deadline: "2022-12-12", id: @task.id).exists?, "task not updated"
  end

  test "should delete task" do
    assert_difference("Task.count", -1, "task count did not decrease by 1") do
      @task.destroy
    end

    assert_not Task.exists?(@task.id),  "task not deleted"
  end
end
