Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'sessions#new'
  get '/profile', to: 'users#show'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new' 

  post '/signup',  to: 'users#create'
  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do 
    resources :categories
  end
  resources :users
  resources :categories
end
