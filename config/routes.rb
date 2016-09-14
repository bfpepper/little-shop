Rails.application.routes.draw do

  resources :items, only: [:index, :show]

  # namespace :cart do
  #   resources :items, only: [:create, :index]
  # end

  get '/cart', to: "cart#show"
  post '/cart', to: "cart#update"
  delete '/cart', to: "cart#destroy"

  get '/:category', to: "categories#show"

end
