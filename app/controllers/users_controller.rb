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
    # using session[:user_id] so user can't update id in params and see another user's dashboard. If id in url is updated to another id, current_user's dashboard is displayed but manually entered id displays in url.
    @user = User.find_by_id(session[:user_id])
    
    if !!@user
      params[:id] = session[:user_id].to_s
    end
    # render user_path(@user)
    # redirect_if_logged_in
    # if !!@user
    #   redirect_if_logged_in
    # else
    #   redirect_if_not_logged_in
    # end
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :time_zone, :password, :password_confirmation)
    end

end
