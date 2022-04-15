module Noteable
  def index
    @notes = @resource.notes.order(created_at: :desc)
  end

  def create
    note = @resource.notes.new(notes_params)
    if note.save
      flash[:success] = flash_message_for(note, :successfully_created)
    else
      flash[:error] = note.errors.full_messages.join(", ")
    end
    redirect_back(fallback_location: '/')
  end

  def destroy
    note = @resource.notes.find_by(id: params[:id])
    if note.destroy
      flash[:success] = flash_message_for(note, :successfully_removed)
    else
      flash[:error] = note.errors.full_messages.join(', ')
    end
    redirect_back(fallback_location: '/')
  end
end
