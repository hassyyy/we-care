Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "avo/contributions#index"

  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
end
