Rails.application.routes.draw do
  root to: "home#index"
  get "/recipe", to: "recipe#index", as: :recipe_index
  get "/new", to: "recipe#new", as: :recipe_new
  post "/new", to: "recipe#create", as: :recipe_create
  get "/:id/edit", to: "recipe#edit", as: :edit_recipe
  patch "/:id/edit", to: "recipe#update", as: :recipe_update
  get "/:id", to: "recipe#show"
  delete "/:id/delete", to: "recipe#delete", as: :recipe_delete
end
