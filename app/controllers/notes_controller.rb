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

  def show
    if current_note && current_user.id == current_note.user.id
      render :show
    else
      redirect_to user_path(current_user)
    end
  end

  def edit
    # not using current_note because of issues with update action
    @note = Note.find_by_id(params[:id])
    if @note && current_user.id == @note.user.id
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    # when using current_note errors do not render
    @note = Note.find_by_id(params[:id])
    if @note.update(note_params)
      redirect_to user_path(current_user)
      flash[:message] = "Note successfully updated."
    else
      # url changes to note/:id, but edit view is rendered with errors
      render :edit
    end
  end

  def destroy
    if current_note && current_user.id == current_note.user.id
      current_note.delete
      flash[:message] = "Note successfully deleted."
    end
    redirect_to user_path(current_user)
  end

  private

  def note_params
    params.require(:note).permit(:title, :body)
  end

  def current_note
    note = Note.find_by_id(params[:id])
  end
end
