class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user.admin? && user.authenticate([:session][:password])
      session[:user_id] = user.id
      redirect_to '/admin'
    elsif user && user.authenticate([:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      render :new
    end
  end

end
