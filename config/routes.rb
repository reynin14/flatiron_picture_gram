Rails.application.routes.draw do
  resources :sessions
  resources :comments
  resources :picture_tags
  resources :tags
  resources :pictures
  resources :users

  post 'users/new', to: 'users#create'
  post 'pictures/new', to: 'pictures#create'

  root to: 'sessions#new'

  # get '/users/new', to: 'users#new', as: '/signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
