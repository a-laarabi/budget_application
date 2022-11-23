class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.where(user_id: current_user.id)
  end

  def show
    @category = Category.find(params[:id])
    @records = @category.records.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.create(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:user_id, :name, :icon)
  end
end
