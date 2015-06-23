Rails.application.routes.draw do
  root "home#index"
  resources :home, only: [:index]
  resources :users
  # session
  get "/auth/github/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#failure"
  delete "/logout", to: "sessions#destroy"
end
