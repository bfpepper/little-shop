Rails.application.routes.draw do

  root to: "home#show"

  resources :users, only: [:new, :create, :show]

  resources :items, only: [:index]

  get '/dashboard', to: "users#show"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/:category', to: "categories#show"

end
