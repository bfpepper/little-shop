Rails.application.routes.draw do

  root to: "home#show"

  resources :users, only: [:new, :create, :show]
  resources :items, only: [:index, :show]
  resources :orders, only: [:index, :show]


  get '/dashboard', to: "users#show"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/cart', to: "cart#show"
  post '/cart', to: "cart#update"
  delete '/cart', to: "cart#destroy"

  get '/:category', to: "categories#show"

end
