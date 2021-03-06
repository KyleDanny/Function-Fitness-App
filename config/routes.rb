Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  get 'profile-page', to: 'pages#profile_page'

  resources :personalized_trainers do
    resources :bookings, only: [:create, :edit, :update, :destroy, :show]
  end

  get 'dashboard', to: 'dashboards#index'

  resources :bookings, only: [:update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :conversations do
    resources :messages
  end

  resources :orders, only: [:show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
