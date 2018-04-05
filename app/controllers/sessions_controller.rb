class SessionsController < ApplicationController
  def new
    session[:user_id] = nil
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      flash[:notice] ='Logged in successfully.'
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash.now.alert = "Login failed."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root
  end
end
