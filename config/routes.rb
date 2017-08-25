Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'

  root 'home#index'

  devise_for :admin_users

  namespace :admin do
    root 'home#index'

    resources :home, only: [:index]
    resources :admin_users, except: [:show]
    resources :sidekiq, only: [:index]

    authenticate :admin_user do
      mount Sidekiq::Web => '/sidekiq_iframe'
    end
  end
end
