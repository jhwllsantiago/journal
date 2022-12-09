require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:one)
    @task = tasks(:one)
  end

  test "should create task" do
    assert_difference("Task.count") do
      post category_tasks_url(@task.category), params: { task: { title: @task.title, completed: @task.completed, deadline: @task.deadline} }
    end

    assert_redirected_to category_url(@task.category)
  end

  test "should update task" do
    patch category_task_url(category_id: @task.category, id: @task), params: { task: { title: @task.title, completed: @task.completed, deadline: @task.deadline} }
    assert_redirected_to category_url(@task.category)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete category_task_url(category_id: @task.category, id: @task)
    end

    assert_redirected_to category_url(@task.category)
  end
end
