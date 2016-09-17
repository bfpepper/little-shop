class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path, id: @user.id
    else
      render :new
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to admin_dashboard_index_path
    else
      render :edit
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user)
          .permit(:id, :name, :username, :password, :password_confirmation)
  end
end
