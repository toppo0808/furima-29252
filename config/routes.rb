Rails.application.routes.draw do
  
  devise_for :users
  root to: 'items#index'
  resources :user, only: [:index,:create,:new]
  resources :items do
    resources :pay, only: [:index,:create] 
  end
end