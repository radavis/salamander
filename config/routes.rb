Rails.application.routes.draw do
  root to: "products#index"
  resources :products, only: [:index, :new, :create, :show]

  get "/auth/:provider/callback", to: "sessions#create"
  get "/auth/failure", to: "sessions#new"
  resources :sessions, only: [:new, :create, :destroy]
end
