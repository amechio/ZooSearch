Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
  end

  root to: 'tops#index'

  resources :tops
  resources :zoos do
    collection do
      match 'search' => 'zoos#search', via: [:get, :post], as: :search
    end
  end
  resources :animals do
    collection do
      match 'search' => 'animals#search', via: [:get, :post], as: :search
    end
  end
  resources :users
  resources :affiliations
  resources :favorite_zoos
  resources :favorite_animals

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
