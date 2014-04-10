BarbotRails::Application.routes.draw do
  get "/recipes/all" => "recipes#all"
  get "/admin" => "admin#index"
  
  devise_for :users
  resources :ingredients, :recipes
  get "/about" => 'public#about'
  root :to => 'public#index'
end
