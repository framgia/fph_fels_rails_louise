Rails.application.routes.draw do
  get 'answers/new'
  get 'lessons/new'
  get 'words/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get '/profile', to: 'users#show'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new' 

  post '/signup',  to: 'users#create'
  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do 
    resources :categories do
      resources :words
    end
  end

  resources :lessons do
    resources :answers
  end
  
  resources :lessons, only: [:show, :update, :destroy]
  resources :words
  resources :users
  resources :categories
  
end
