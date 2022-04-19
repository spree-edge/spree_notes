Spree::Core::Engine.add_routes do
  namespace :admin do
    concern :noteable do
      resources :notes, only: %i[index create destroy]
    end

    resources :orders, only: [], concerns: :noteable
    resources :users, only: [], concerns: :noteable

    resource :note_settings
  end
end
