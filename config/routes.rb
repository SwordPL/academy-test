Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  get '/all_users', to: 'users#index'

  resources :users
  resources :cities
end
