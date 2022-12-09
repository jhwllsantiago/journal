class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /categories
  def index
    @categories = Category.where(user_id: current_user.id)
  end

  # GET /categories/1
  def show
    @tasks = @category.tasks.order(deadline: :asc)
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
    @category.user = current_user

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_url, notice: "#{@category.name.upcase} has been added." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "#{@category.name.upcase} has been updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, alert: "#{@category.name.upcase} category and all tasks under it has been deleted." }
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :details)
    end
end
