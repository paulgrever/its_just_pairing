Rails.application.routes.draw do
  root "home#index"
  get "/dashboard", to: "home#dashboard"
  resources :home, only: [:index]
  resources :users, only: [:edit, :update, :show]
  resources :matches
  # session
  get "/auth/github/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  delete "/logout", to: "sessions#destroy"
end
