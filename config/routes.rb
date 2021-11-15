# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :items, except: :show
  resources :customers, except: :show
  root to: 'welcome#index'
end
