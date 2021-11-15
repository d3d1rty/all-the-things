# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :items
  resources :customers
  resources :loans
  root to: 'welcome#index'
end
