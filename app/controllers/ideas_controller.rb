class IdeasController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas
  end

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
  end

  def edit
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.create(idea_params)
    redirect_to user_ideas_path(@user)
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :body, :category_id)
  end
end
