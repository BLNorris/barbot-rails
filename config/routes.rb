BarbotRails::Application.routes.draw do
  get "/recipes/all" => "recipes#all"
  get "/admin" => "admin#index"
  get "recipes/pour/:id" =>"recipes#pour", as: "pour_recipe"
  devise_for :users
  resources :ingredients, :recipes
  get "/about" => 'public#about'
  root :to => 'public#index'
end
