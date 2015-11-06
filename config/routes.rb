Rails.application.routes.draw do
  resources :user_logs
  root 'static_pages#home'

  devise_for :users
  resources :users, only: :show
  resources :friends, only: [:create, :destroy, :update]
end
