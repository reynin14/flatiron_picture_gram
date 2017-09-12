Rails.application.routes.draw do
  resources :comments
  resources :picture_tags
  resources :tags
  resources :pictures
  resources :users

  post 'users/new', to: 'users#create'

  # get '/users/new', to: 'users#new', as: '/signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
