Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users do
    resources :butcheries, only: [:show, :new, :create, :edit, :update, :destroy] do
      resources :products
    end
  end

  resources :users do
    resources :products
  end
  resources :butcheries, only: [:index]
end
