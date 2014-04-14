BarbotRails::Application.routes.draw do

  get "/admin" => "admin#index"
  get "/config" => "admin#bot_config"
  get "/recipes/random" => "recipes#random"
  get "/recipe/upvote/:id" => "recipes#upvote"
  get "/recipe/downvote/:id" => "recipes#downvote"
  post "/recipe/upvote/:id" => "recipes#upvote"
  post "/recipe/downvote/:id" => "recipes#downvote"
  get "/recipes/pour/:id" =>"recipes#pour", as: "pour_recipe"
  devise_for :users
  resources :ingredients, :recipes
  get "/about" => 'public#about'
  root :to => 'public#index'
end
