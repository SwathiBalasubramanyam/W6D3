Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users
#   this one line gives us below 8 urls
#   Prefix Verb   URI Pattern               Controller#Action
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PATCH  /users/:id(.:format)      users#update
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy


  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'

  # get '/users/new', to: 'users#new'
  # get '/users/:id/edit', to: 'users#edit', as: 'edit_user' # returns a form to edit

  # get '/users/:id', to: 'users#show', as: 'user'
  # patch '/users/:id', to: 'users#update'

  # put '/users/:id', to: 'users#update'

  # delete '/users/:id', to: 'users#destroy'

  resources :users, only: [:index, :show, :update, :destroy, :create]
  resources :art_works, only: [:show, :update, :destroy, :create]
  resources :art_work_shares, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy]

  resources :users do
    resources :art_works, only: :index
    resources :collections, only: [:index, :create]
    
    # resources :comments, only: :index
  end



  resources :art_works do
    resources :likes, only: :index
    
  end

  resources :comments do
    resources :likes, only: :index
  end

  patch '/users/:user_id/art_works/:id', to: 'art_works#favorite'
  patch '/users/:user_id/art_work_shares/:id', to: 'art_work_shares#favorite'

end