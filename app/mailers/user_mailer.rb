class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]

    mail(to: @user.email, subject: "Welcome, #{@user.first_name}!")
  end
end
