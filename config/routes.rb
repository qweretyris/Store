Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root "categories#index"

  resources :categories do 
    collection do 
      post :filter
    end
  end

  resources :products do
    resources :comments
  end


end
