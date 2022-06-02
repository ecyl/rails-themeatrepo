Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :butcheries, only: [:index, :show, :new, :create] do
    resources :products, only: [:new, :create]
  end
  resources :products, only: [:index, :show] do
    resources :orders, only: [:index, :new, :create]
  end

end
