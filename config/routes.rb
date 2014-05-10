BarbotRails::Application.routes.draw do

  get "dispenser/update"

  get "/admin" => "admin#index"
  get "/config" => "admin#bot_config"
  get "/recipes/random" => "recipes#random"
  post "/recipe/upvote/:id" => "recipes#upvote"
  post "/recipe/downvote/:id" => "recipes#downvote"
  get "/recipes/pour/:id" =>"recipes#pour", as: "pour_recipe"
  devise_for :users
  resources :ingredients, :recipes, :dispensers
  get "/about" => 'public#about'
  root :to => 'public#index'
end
