class SessionsController < ApplicationController
  def new #login?
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
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
