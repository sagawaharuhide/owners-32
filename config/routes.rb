Rails.application.routes.draw do

  devise_for :users
  root 'plans#index'
  resources :plans, only: [:index, :show] do
    collection do
      get 'sort_by_category'
      get 'sort_by_price'
    end
  end
  resources :courses, only: [:index, :show] do
    resources :orders, only: [:new, :create]do
      collection do
        get 'input'
        get 'confirm'
      end
    end
  end
  resources :users, only: [:index, :show, :edit, :update] do
    resources :addresses, only: [:index, :new, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
