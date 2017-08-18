Rails.application.routes.draw do
  root 'home#index'

  devise_for :admin_users

  namespace :admin do
    resources :home, only: [:index]
  end
end
