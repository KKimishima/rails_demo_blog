Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'articles#index'
  resources :about, only:[:index]
  resources :articles
  resources :archives, only: [:show]
  resources :tags
  resources :users, only: [:edit, :update, :show]
  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
