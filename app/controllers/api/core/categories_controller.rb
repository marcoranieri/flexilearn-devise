class Api::Core::CategoriesController < Api::Core::BaseController
  def index
    @categories = Category.all
  end
end
