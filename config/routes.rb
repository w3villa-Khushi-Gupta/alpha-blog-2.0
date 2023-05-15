Rails.application.routes.draw do
  resources :users 
  resources :articles
  root 'pages#index'
  get 'about', to:'pages#about'
  get 'signup', to:'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :categories, except: [:destroy]
end
