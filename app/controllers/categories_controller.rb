class CategoriesController < ApplicationController
  def create
    if current_admin?
      @category = Category.create(category_params)
      redirect_to admin_categories_path
    end
  end

  private
  def category_params
    params.require(:category).permit(:title)
  end
end
