Rails.application.routes.draw do
  root to: 'home#show'

  resources :users, only: [:new, :create, :show]
  resources :items, only: [:index, :show]
  resources :orders, only: [:index, :show, :create]

  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/cart', to: 'cart#show'
  post '/cart', to: 'cart#new'
  delete '/cart', to: 'cart#destroy'
  put '/cart', to: 'cart#update'

  get '/:category', to: 'categories#show'

  namespace :admin do
    resources :dashboard, only: [:index]
  end
end
