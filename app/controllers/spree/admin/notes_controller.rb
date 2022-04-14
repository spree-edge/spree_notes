class NotesController < Spree::Admin::BaseController
  include ResourceFinder

  def index
    @notes = parentable.notes
  end

  def create
    note = parentable.notes.new(notes_params)
    if note.save
      flash[:success] = flash_message_for(note, :successfully_created)
    else
      flash[:error] = note.errors.full_messages.join(", ")
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def notes_params
    params.require(:note).permit(:note, :user_id)
  end
end
