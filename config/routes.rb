Rails.application.routes.draw do
  get 'bookings/create'
  get 'bookings/edit'
  get 'bookings/destroy'
  get 'user_tags/create'
  get 'user_tags/destroy'
  get 'walks/index'
  get 'walks/new'
  get 'walks/show'
  get 'walks/create'
  get 'walks/edit'
  get 'walks/update'
  get 'walks/destroy'
  get 'dogs/index'
  get 'dogs/new'
  get 'dogs/show'
  get 'dogs/create'
  get 'dogs/edit'
  get 'dogs/update'
  get 'dogs/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
