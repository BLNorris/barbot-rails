BarbotRails::Application.routes.draw do
  devise_for :users
  resources :ingredients, :recipes
  get "/about" => 'public#about'
  root :to => 'public#index'
end
