# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :customers
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :items, except: :show
  root to: 'welcome#index'
end
