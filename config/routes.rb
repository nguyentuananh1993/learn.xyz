Rails.application.routes.draw do
  root "static_pages#home"

  devise_for :users
<<<<<<< HEAD
=======
  
  resources :users, only: :show
  resources :friends, only: [:create, :destroy, :update]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
>>>>>>> task_friend

  resources :users, only: [:show, :index]
  resources :user_logs
  
end
