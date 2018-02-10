require 'sidekiq/web'

Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  mount Sidekiq::Web, at: "/sidekiq"
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'home#index'

  resources :posts, except: [:index, :show, :destroy] do
    resources :comments
  end
  resources :users do
    resources :posts, only: [:show, :destroy]
  end
end
