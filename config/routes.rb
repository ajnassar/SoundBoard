Rails.application.routes.draw do
  resources :boards

  resources :sounds, only: [:index, :create]

  post "/boards/add_sounds" => "boards#add_sounds", as: :add_sounds
end
