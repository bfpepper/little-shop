class SessionsController < ApplicationController
  def new
  end

  def create
    render text: request.env["omniauth.auth"].inspect
    # user = User.find_by(username: params[:session][:username])
    # if user && user.admin? && user.authenticate(params[:session][:password])
    #   session[:user_id] = user.id
    #   redirect_to admin_dashboard_index_path
    # elsif user && user.authenticate(params[:session][:password])
    #   session[:user_id] = user.id
    #   redirect_to dashboard_path
    # else
    #   render :new
    # end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
