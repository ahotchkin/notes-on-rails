class NotesController < ApplicationController
  before_action :redirect_if_not_logged_in
  helper_method :current_note

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

  def edit
    if current_user.id == current_note.user.id
      render :edit
    else
      render user_path(current_user)
    end
  end

  def update
    if current_note.update(note_params)
      redirect_to user_path(current_user)
      flash[:message] = "Note successfully updated."
    else
      render :edit
    end
  end

  private

    def note_params
      params.require(:note).permit(:title, :body)
    end

    def current_note
      note = Note.find_by_id(params[:id])
    end

end
