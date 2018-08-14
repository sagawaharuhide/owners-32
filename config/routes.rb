Rails.application.routes.draw do

  devise_for :users
  root 'plans#index'
  get 'orders/confirm'
  resources :plans, only: [:index, :show] do
    resources :orders, only: [:index, :show]
  end
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
