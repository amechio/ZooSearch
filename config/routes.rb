Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/guest_admin_sign_in', to: 'users/sessions#guest_admin_sign_in'
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
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
  namespace :admin do
    resources :users
  end
  resources :affiliations
  resources :favorite_zoos
  resources :favorite_animals
  resources :contacts

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
