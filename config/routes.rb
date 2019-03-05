Rails.application.routes.draw do
  get 'words/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get '/profile', to: 'users#show'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new' 
  get '/dashboard', to: 'users#dashboard'
  get '/settings', to: 'users#edit'
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
  resources :users
  resources :categories
  resources :words, only: [:index]
end
