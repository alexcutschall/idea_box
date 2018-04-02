class Admin::CategoriesController < ApplicationController
  before_action :require_admin

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to admin_categories_path
  end

  private
  def require_admin
    render file: "/public/404" unless current_admin?
  end
end
