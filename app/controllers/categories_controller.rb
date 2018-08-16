class CategoriesController < ApplicationController
  before_action :find_category, only: [ :show ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    if current_tutor

      @category = Category.new(category_params)
      @category.tutor = current_tutor

      if @category.save
        redirect_to categories_path
      else
        render :new
      end

    else
        redirect_to categories_path
    end
  end

  def show
  end

  private

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:id, :tutor_id, :category_id, :name, :description, :price)
  end

end
