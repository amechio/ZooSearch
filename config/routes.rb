Rails.application.routes.draw do
  resources :zoos
  resources :animals
  resources :users
  resources :sessions
  resources :affiliations
  resources :favorite_zoos, only: [:create, :destroy]
  resources :favorite_animals, only: [:create, :destroy]
end
