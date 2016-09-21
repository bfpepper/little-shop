class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username]) if params[:session]
    if request.env["omniauth.auth"]
      login_with_omniauth
    elsif user && user.admin? && user.authenticate(params[:session][:password])
      login_as_admin(user)
    elsif user && user.authenticate(params[:session][:password])
      login_as_default_user(user)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def login_with_omniauth
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def login_as_admin(user)
    session[:user_id] = user.id
    redirect_to admin_dashboard_index_path
  end

  def login_as_default_user(user)
    session[:user_id] = user.id
    redirect_to dashboard_path
  end
end
