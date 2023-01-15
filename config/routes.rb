Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root "categories#index"

  post '/cart/:product_id/user/:user_id', to: 'carts#create', as: 'add_to_cart'
  resources :carts, :only => [:index, :destroy]

  resources :categories do 
    collection do 
      post :filter
      post :search
      get :search
    end
  end

  resources :products do
    resources :comments
  end


end
