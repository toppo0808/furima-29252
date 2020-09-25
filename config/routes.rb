Rails.application.routes.draw do
  
  devise_for :users
  root to: 'items#index'
  resources :user, only: [:index,:create,:new]
  resources :items
  resources :cards, only: [:index,:new,:create,:destroy,:show] do
    member do
      post 'pay'
    end
  end
end