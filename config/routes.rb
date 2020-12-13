Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  match '/auth/:provider/callback', to: 'auth#callback', via: [:get, :post]
  get 'auth/signout'
  get 'signup', to: 'users#new'
  post 'users', to: 'users#create'
  get 'login', to: 'users#login'
  post 'login', to: 'users#attempt_login'
  resources :projects do
    resources :features
  end
  resources :tasks
end
