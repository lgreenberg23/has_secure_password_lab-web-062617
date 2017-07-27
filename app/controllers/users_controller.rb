class UsersController < ApplicationController
  before_action :logged_in, only: :homepage

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    redirect_to homepage_path #session?
  end

  def homepage
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
