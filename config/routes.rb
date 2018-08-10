Rails.application.routes.draw do
  devise_for :users
  root 'plans#index'
  get 'orders/confirm'
  resources :plans, only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
