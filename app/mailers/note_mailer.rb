class NoteMailer < ApplicationMailer
  def note_email(user, note)
    @user = user
    @note = note

    mail(to: @user.email, subject: "#{@user.first_name}, You Have a New Note!")
  end
end
