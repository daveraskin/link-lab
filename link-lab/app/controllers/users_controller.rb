class UsersController < ApplicationController


  def new

  end

  def create
    @user = User.create(user_params)
    if @user.id
    redirect_to login_path
    else
    flash[:danger] = "Credentials Invalid"
    redirect_to signup_path
    end

  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name)
  end


end