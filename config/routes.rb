Rails.application.routes.draw do
  root to: 'home#index'
  get 'rewards', to: 'home#rewards'
  resources :rewards
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resource :invoices
  resource :points
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
