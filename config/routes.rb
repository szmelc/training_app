Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'home#index'
  resources :posts, except: [:show]
  resources :users do
    resources :posts, only: [:show]
  end
end
