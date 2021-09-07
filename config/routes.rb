# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  namespace :api do
    namespace :v1 do
      post '/auth/login', to: 'authentication#login'

      resources :users, only: :create do
        collection do
          patch :password
        end
      end

      resources :currencies, only: :index
    end
  end
end
