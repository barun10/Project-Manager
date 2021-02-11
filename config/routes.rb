Rails.application.routes.draw do
  mount Notifications::Engine => "/notifications"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users, only: [:new, :create]
  get '/auth/:provider/callback', to: 'sessions#create', :via => [:get, :post]
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :projects do
    resources :features, except: [:index]
  end
  resources :tasks, only: [:create, :update, :destroy]
  resources :comments, except: [:index, :show, :new]

end
