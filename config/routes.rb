Spree::Core::Engine.add_routes do
  namespace :admin do
    resource :note_settings

    concern :noteable do
      resources :notes, only: %i[index create destroy]
    end

    resources :orders, only: [], concerns: :noteable
    resources :users, only: [], concerns: :noteable
    resources :products, only: [], concerns: :noteable
  end
end
