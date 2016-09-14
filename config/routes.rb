Rails.application.routes.draw do

  resources :items, only: [:index]

  # namespace :cart do
  #   resources :items, only: [:create, :index]
  # end

  get '/cart', to: "cart#show"
  post '/cart', to: "cart#update"

  get '/:category', to: "categories#show"

end
