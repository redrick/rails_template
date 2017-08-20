Rails.application.routes.draw do
  root 'home#index'

  devise_for :admin_users

  namespace :admin do
    root 'home#index'

    resources :home, only: [:index]
    resources :admin_users, except: [:show]
  end
end
