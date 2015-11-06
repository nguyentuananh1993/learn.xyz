Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users

  resources :users, only: [:show, :index]
  resources :user_logs
  
end
