Rails.application.routes.draw do
  root to: 'home#index'

  resources :home, only: [:index]
  resources :skeletons
  #resources :settings
  resources :accounts
  resources :sessions, only: [:new, :create, :destroy]

  scope :api, path: '/api', module: :api do
    resources :skeletons, only: [:show]
  end
end
