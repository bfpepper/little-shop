Rails.application.routes.draw do

  resources :items, only: [:index]
  get '/:category', to: "categories#show"

end
