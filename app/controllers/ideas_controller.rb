class IdeasController < ApplicationController
  def new
    @user = current_user
    @idea = Idea.new
  end
end
