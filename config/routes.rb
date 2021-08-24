Rails.application.routes.draw do
  root to: 'tops#index'
  resources :tops do
    collection do
      get 'search'
    end
  end
  resources :zoos
  resources :animals
  resources :users
  resources :sessions
  resources :affiliations
  resources :favorite_zoos, only: [:create, :destroy]
  resources :favorite_animals, only: [:create, :destroy]
end
