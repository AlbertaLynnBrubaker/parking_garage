Rails.application.routes.draw do
  resources :commuters, only: [:create, :show, :destroy]
  resources :parking_spaces, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
