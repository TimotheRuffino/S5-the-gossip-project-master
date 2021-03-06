Rails.application.routes.draw do
  root 'root#index'
  resources :gossips
  resources :comments

  resources :sessions, only: [:new, :create, :destroy]

  
  resources :users, only: [:show, :new, :create]
  resources :welcome, only: [:index]
  
  resources :contact, only: [:index]
  resources :team, only: [:index]
  resources :root, only: [:index]
  resources :city, only: [:show]
end
