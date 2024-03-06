Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check
  get "/dashboard", to: "pages#dashboard"
  get 'breeds/autocomplete', to: 'breeds#autocomplete'

  resources :dogs

  resources :walks do
    resources :bookings, only: [:create]
  end
  resources :user_tags, only: [:create, :destroy]
  resources :bookings, only: [:update, :destroy]

  # A NESTER : resources :reviews, only [:create, :update, :destroy]
  root to: "pages#home"
end
