Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  resources :posts, except: [:show, :destroy] do
    resources :comments
  end
  resources :users do
    resources :posts, only: [:show, :destroy]
  end
end
