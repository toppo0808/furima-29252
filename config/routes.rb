Rails.application.routes.draw do
  
  devise_for :users
  root to: 'items#index'
  resources :user, only: [:index,:create,:new]
  resources :items, only: [:new, :create, :index]

end
