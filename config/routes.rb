Rails.application.routes.draw do
  resources :sessions
  resources :comments
  resources :picture_tags
  resources :tags
  resources :pictures
  resources :users

  post 'users/new', to: 'users#create'
  post 'pictures/new', to: 'pictures#create'
  post 'sessions/new', to: 'sessions#create'
  post '/pictures/comments', to: 'comments#create'
  post '/comments/comments', to: 'comments#destroy'
  post '/sessions/destroy_all', to: 'sessions#destroy_all'
  post '/tags/create', to: 'tags#create'



  post '/users/sessions', to: 'sessions#destroy', as: 'logout'

  get '/users/pictures/new', to: 'pictures#new'
  get '/pictures/:id/tags/new', to: 'tags#new'

  get '/', to: 'sessions#new'
  get '/users/:id/welcome', to: 'users#welcome'

  # get '/users/new', to: 'users#new', as: '/signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
