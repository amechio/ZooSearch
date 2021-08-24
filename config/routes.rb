Rails.application.routes.draw do
  root to: 'tops#index'
  resources :tops
  # resources :tops do
  #   collection do
  #     match 'search' => 'zoos#search', via: [:get, :post], as: :search
  #     match 'search' => 'animals#search', via: [:get, :post], as: :search
  #   end
  # end
  # resources :zoos
  resources :zoos do
    collection do
      match 'search' => 'zoos#search', via: [:get, :post], as: :search
    end
  end
  # resources :animals
  resources :animals do
    collection do
      match 'search' => 'animals#search', via: [:get, :post], as: :search
    end
  end
  resources :users
  resources :sessions
  resources :affiliations
  resources :favorite_zoos, only: [:create, :destroy]
  resources :favorite_animals, only: [:create, :destroy]
end
