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
    @user = current_user
  end

  def update
    @user = current_user
    if current_user.admin? && current_user.update(user_params)
      redirect_to admin_dashboard_index_path
    elsif current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def show
    if current_user
      @user = current_user
    else
      render file: '/public/404', layout: false
    end
  end

  private

  def user_params
    params.require(:user).permit(:id,
                                 :name,
                                 :phone_number,
                                 :username,
                                 :password,
                                 :password_confirmation)
  end
end
