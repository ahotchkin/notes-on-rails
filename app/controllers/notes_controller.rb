class NotesController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

    def note_params
      params.require(:note).permit(:title, :body)
    end

end
