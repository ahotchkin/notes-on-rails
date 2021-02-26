class NoteMailer < ApplicationMailer
  def note_email
    @user = params[:user]
    @note = params[:note]

    mail(to: @user.email, subject: "#{@user.first_name}, You Have a New Note!")
  end
end
