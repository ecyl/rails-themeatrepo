Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'show', to: 'pages#show'

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :butcheries, only: [:index, :show, :new, :create] do
    resources :products, only: [:new, :create]
  end
  resources :products, only: [:index, :show] do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [:index, :show, :update]
end
