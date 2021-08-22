Rails.application.routes.draw do
  resources :zoos
  resources :animals
  resources :users
  resources :sessions
end
