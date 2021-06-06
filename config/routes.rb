Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  get "/tracking", to: "tracking#index", as: :tracking_index

  get "/day", to: "day#index", as: :day_index
  get "/day/new", to: "day#new", as: :day_new
  post "/day/new", to: "day#create", as: :day_create
  get "/day/:id/edit", to: "day#edit", as: :edit_day
  patch "/day/:id/edit", to: "day#update", as: :day_update
  get "day/:id", to: "day#show"
  post "/day/reset", to: "day#reset_plan"

  get "/recipe", to: "recipe#index", as: :recipe_index
  get "/new", to: "recipe#new", as: :recipe_new
  post "/new", to: "recipe#create", as: :recipe_create
  get "/:id/edit", to: "recipe#edit", as: :edit_recipe
  patch "/:id/edit", to: "recipe#update", as: :recipe_update
  get "/:id", to: "recipe#show"
  delete "/:id/delete", to: "recipe#delete", as: :recipe_delete
end
