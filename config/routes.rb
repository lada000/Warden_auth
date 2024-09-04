Rails.application.routes.draw do
  root to: 'sessions#new'

  get "up" => "rails/health#show", as: :rails_health_check

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end

