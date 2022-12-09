class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category

  def create
    @task = @category.tasks.create(task_params)
    @task.user = current_user

    if @task.save
      redirect_to category_path(@category), notice: "#{@task.title.capitalize} has been added to #{@category.name.upcase}."
    else
      redirect_to category_path(@category), alert: "An error occured. #{@task.title.capitalize} was not added."
    end
  end

  def destroy
    @task = @category.tasks.find(params[:id])
    @task.destroy
    redirect_to category_path(@category), alert: "#{@task.title.capitalize} has been deleted."
  end

  def update
    @task = @category.tasks.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to category_url(@category), notice: "#{@task.title.capitalize} has been updated." }
      else
        format.html { redirect_to category_url(@category), alert: "An error occured. #{@task.title.capitalize} was not updated." }
      end
    end
  end

  private

  def set_category
    @category = Category.find(params[:category_id])
  end

  def task_params
    params.require(:task).permit(:body, :title, :completed, :deadline)
  end
end
