class SessionsController < ApplicationController

  before_action :redirect_if_logged_in, except: :destroy

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Username or password is incorrect."
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    redirect_to login_path
  end

end
