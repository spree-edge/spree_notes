Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :note_settings

    concern :noteable do
      resources :notes, only: %i[index create destroy]
    end

    SpreeNotes::Config[:noteables].each do |note_model|
      resources note_model.split('_').last.to_sym, only: [], concerns: :noteable
    end

    resources :notes, only: [:update]
  end
end
