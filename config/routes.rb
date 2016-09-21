Rails.application.routes.draw do
  root to: 'home#show'

  resources :users, only: [:new, :create, :show, :update, :edit]
  resources :items, only: [:index, :show]
  resources :orders, only: [:index, :show, :create, :update]

  get '/dashboard', to: 'users#show'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/cart', to: 'cart#show'
  post '/cart', to: 'cart#new'
  delete '/cart', to: 'cart#destroy'
  put '/cart', to: 'cart#update'

  get '/:category', to: 'categories#show'

  get '/auth/twitter', as: 'twitter_login'
  get '/auth/twitter/callback', to: 'sessions#create'

  namespace :admin do
    resources :dashboard, only: [:index, :edit]
    resources :items, only: [:new, :create]
  end
end
