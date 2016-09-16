class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.admin?
        redirect_to admin_dashboard_index_path
      elsif user.default?
        redirect_to dashboard_path(id: user.id)
      end
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
