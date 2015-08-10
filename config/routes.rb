Rails.application.routes.draw do
  root: "sessions#index"

  resources :posts

  get '/signup', to: "users#new"
  get '/profile', to: "users#show"

  resources :users, only: [:create]

  get '/login', to: "comments#new"
  get '/logout', to: "comments#destroy"

  resources :comments, only: [:create]
end
