# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  resources :transactions
  mount Sidekiq::Web => '/sidekiq'
  devise_for :users
  resources :items
  resources :customers
  resources :loans
  scope :pawn_item_flow do
    get 'customer', to: 'pawn_item_flow#new_customer', as: :customer_pawn_item_flow
    post 'customer', to: 'pawn_item_flow#save_customer', as: :save_customer_pawn_item_flow
    get 'item', to: 'pawn_item_flow#new_item', as: :item_pawn_item_flow
    post 'item', to: 'pawn_item_flow#save_item', as: :save_item_pawn_item_flow
    get 'loan', to: 'pawn_item_flow#new_loan', as: :loan_pawn_item_flow
    post 'loan', to: 'pawn_item_flow#save_loan', as: :save_loan_pawn_item_flow
  end
  root to: 'welcome#index'
end
