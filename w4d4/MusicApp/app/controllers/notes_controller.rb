class NotesController < ApplicationController
  # before_action :require_current_user!, only: :destroy

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    unless @note.save
      flash.now[:errors] = @note.errors.full_messages
    end
    redirect_to track_url(@note.track_id)
  end

  def destroy
    @note = Note.find(params[:id])
    if current_user.id == @note.user_id
      @note.destroy
    else
      flash[:errors] = ["403 FORBIDDEN"]
    end
    redirect_to track_url(@note.track_id)
  end

  private
  def note_params
    params.require(:note).permit(:text, :track_id)
  end
end
