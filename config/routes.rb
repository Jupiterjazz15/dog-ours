Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  get "up" => "rails/health#show", as: :rails_health_check
  get "/dashboard", to: "pages#dashboard"

  resources :dogs
  resources :walks do
    resources :bookings, only: [:create]
  end
  resources :user_tags, only: [:create, :destroy]
  resources :bookings, only: [:update, :destroy]
    # A NESTER : resources :reviews, only [:create, :update, :destroy]
end
