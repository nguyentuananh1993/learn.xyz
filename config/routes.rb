Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users

  resources :goals
  resources :word_learning_logs

  resources :users, only: [:show, :index]
  resources :friends, only: [:create, :destroy, :update]
  resources :user_logs
  
end
