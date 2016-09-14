Rails.application.routes.draw do

  resources :items, only: [:index]

  namespace :cart do
    resources :items, only: [:create, :index]
  end

  get '/:category', to: "categories#show"

end
