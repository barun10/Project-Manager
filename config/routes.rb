# frozen_string_literal: true

Rails.application.routes.draw do
  mount Notifications::Engine => '/notifications'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: %i[new create]
  get '/auth/:provider/callback', to: 'sessions#create', via: %i[get post]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :projects do
    resources :features, except: [:index]
  end
  resources :tasks, only: %i[create update destroy]
  resources :comments, except: %i[index show new]
end
