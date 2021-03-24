Rails.application.routes.draw do
  root to: "home#index"

  get "/recipe", to: "recipe#index"
  get "recipe/show/:id", to: "recipe#show"

  get "/recipe/new", to: "recipe#new"
  get "recipe/edit/:id", to: "recipe#edit"
  post "/recipe/new", to: "recipe#create"
  patch "recipe/:id", to: "recipe#update"
end
