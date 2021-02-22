class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end

  end

  def show
    redirect_if_not_logged_in
    @user = User.find_by_id(session[:user_id])

    if !!@user
      params[:id] = session[:user_id].to_s
    end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :time_zone, :password, :password_confirmation)
    end

end
