class SessionsController < ApplicationController
  def new
  end

  def create
    if request.env["omniauth.auth"]
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      user = User.find_by(username: params[:session][:username])
      if user && user.admin? && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to admin_dashboard_index_path
      elsif user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to dashboard_path
      else
        render :new
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end

def create
  @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
  if @user
    session[:user_id] = @user.id
    redirect_to playlists_path
  end
end
