class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def create
    @task = @category.tasks.create(task_params)
    @task.user = current_user

    if @task.save
      redirect_to category_path(@category), notice: 'Task has been created'
    else
      redirect_to category_path(@category), alert: 'Task has not been created'
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category)
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:body)
  end
end