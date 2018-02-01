Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  resources :posts, except: [:show] do
    resources :comments, only: [:new, :destroy, :create]
  end
  resources :users do
    resources :posts, only: [:show]
  end
end
