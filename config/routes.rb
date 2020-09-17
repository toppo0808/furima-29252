Rails.application.routes.draw do
  
  devise_for :users
  root to: 'items#index'
  
  resources :itemss, only: [:new, :create]

end
