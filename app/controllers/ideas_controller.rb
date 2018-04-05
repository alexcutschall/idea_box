class IdeasController < ApplicationController
  def index
    if current_user.id == params[:user_id].to_i
      @user = User.find(params[:user_id])
      @ideas = @user.ideas
    else
      render :"users/wrong_user"
    end
  end

  def new
    @user = User.find(params[:user_id])
    @idea = Idea.new
  end

  def create
    @user = User.find(params[:user_id])
    @idea = @user.ideas.create(idea_params)
    redirect_to user_ideas_path(@user)
  end

  def edit
    @user = User.find(params[:user_id])
    @idea = Idea.find(params[:id])
  end

  def show
    @idea = Idea.find(params[:id])
    @image = Image.new
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    if @idea.save
      flash[:success] = "#{@idea.title} was updated!"
      redirect_to user_ideas_path(@idea.user)
    else
      flash[:notice] = "You left out important information!"
      render :edit
    end
  end

  def destroy
    if current_user.id == params[:user_id].to_i
      idea = Idea.find(params[:id])
      Idea.destroy(idea.id)
      redirect_to user_ideas_path(idea.user)
    else
      render :"users/wrong_user"
    end
  end

  private
  def idea_params
    params.require(:idea).permit(:title, :body, :category_id)
  end
end
