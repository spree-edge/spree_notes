module Noteable
  def index
    @notes = @order.notes
  end

  def create
    note = @order.notes.new(notes_params)
    if note.save
      flash[:success] = flash_message_for(note, :successfully_created)
    else
      flash[:error] = note.errors.full_messages.join(", ")
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    note = @order.notes.find_by(id: params[:id])
    if note.destroy
      flash[:success] = flash_message_for(note, :successfully_removed)
    else
      flash[:error] = note.errors.full_messages.join(', ')
    end
    redirect_back(fallback_location: root_path)
  end
end
