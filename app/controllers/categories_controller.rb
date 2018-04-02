class CategoriesController < ApplicationController
  def create
    @category = Category.create(category_params)
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end
end
