Spree::Core::Engine.add_routes do
  namespace :admin do
    resources :notes, only: %i[index create destroy]
  end
end
