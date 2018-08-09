Rails.application.routes.draw do
  devise_for :users
  get 'startup/index'
  resources :plans, only: [:index, :show]
  resources :orders, only: [:index]
  resources :users, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
