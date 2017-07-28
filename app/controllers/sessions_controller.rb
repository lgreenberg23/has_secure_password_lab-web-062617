require 'byebug'

class SessionsController < ApplicationController
  def new #login?
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    # byebug
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to #somewhere appropriate
    else
      flash[:message] = "Nice Try Sucker -Z"
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end
end
