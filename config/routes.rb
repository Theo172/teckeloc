Rails.application.routes.draw do
  devise_for :users
  root to: 'teckels#index'
  resources :teckels
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/profile", to: "users#profile"
end
