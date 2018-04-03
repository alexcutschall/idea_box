class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def create
    if current_admin?
      @category = Category.create(category_params)
      redirect_to admin_categories_path
    end
  end

  def new
    @category = Category.new
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
