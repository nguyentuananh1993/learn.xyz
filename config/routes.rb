Rails.application.routes.draw do
  # root "static_pages#home"
  
  authenticated :user do
    root to: "exams#new", as: "authenticated_root"
  end
  unauthenticated do
    root "static_pages#home"
  end

  devise_for :users

  resources :goals
  resources :word_learning_logs

  resources :users, only: [:show, :index]
  resources :friends, only: [:create, :destroy, :update]
  resources :user_logs
  
  resources :goals
  
  resources :exams, except: [:index, :destroy]
  namespace :admin do
    root "users#index"
    resources :imports, only: :create
    resources :users, except: [:show]
    resources :categories do
      resources :questions
    end
  end
  
end
