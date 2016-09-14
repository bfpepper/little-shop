Rails.application.routes.draw do

  root to: "home#show"

  resources :users, only: [:new, :create, :show]

  resources :items, only: [:index]

  get '/login', to: 'sessions#new'

end
