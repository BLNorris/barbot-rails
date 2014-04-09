BarbotRails::Application.routes.draw do
  get "/recipes/all" => "recipes#all"
  
  devise_for :users
  resources :ingredients, :recipes
  get "/about" => 'public#about'
  root :to => 'public#index'
end
