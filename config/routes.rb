Rails.application.routes.draw do
  mount ::Caffeinate::Engine => '/caffeinate'
  devise_for :users, controllers: {
      registrations: 'users/registrations',
      confirmations: 'users/confirmations',
      sessions: 'users/sessions'
  }

  mount Ahoy::Engine => "/yoha"
  resources :campaigns, only: [:index, :show], param: :slug
  resources :campaign_subscriptions, only: [:index, :show, :create, :update, :destroy], param: :token
  resource :profile, only: [:show, :destroy]
  root to: 'root#index'
end
