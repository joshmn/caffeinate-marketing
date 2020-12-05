Rails.application.routes.draw do
  devise_for :users
  mount Caffeinate::Engine => '/caffeinate'

  resources :campaigns, only: [:index, :show], param: :slug
  resources :campaign_subscriptions, only: [:index, :show, :update, :destroy], param: :token
  resources :mailings, only: [:index, :show]
  resource :users, only: [:show, :destroy]
  root to: 'root#index'
end
