Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  get "up" => "rails/health#show", as: :rails_health_check
  get "/dashboard", to: "pages#dashboard"
  get 'breeds/autocomplete', to: 'breeds#autocomplete'
  get "/myprofile", to: "pages#myprofile"
  get "/mywalks", to: "pages#mywalks"
  get "/myrequest", to: "pages#myrequest"

  resources :dogs

  resources :walks do
    get '/discussion', to: "walks#discussion", on: :member
    resources :bookings, only: [:create] do
      resources :messages, only: [:create]
    end
  end
  resources :user_tags, only: [:create, :destroy]
  resources :bookings, only: [:update]
    # A NESTER : resources :reviews, only [:create, :update, :destroy]
  root to: "pages#home"
  resources :bookings, only: [:destroy] do
    member do
      patch :validates
      patch :refused
    end
  end
end
