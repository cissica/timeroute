Rails.application.routes.draw do
  get '/', to: 'application#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2/callback', to: 'sessions#google'
  resources :schedules do 
    resources :tasks, only: [:new, :create, :index]
  end 
  resources :tasks do 
    resources :notes, only: [:new, :create, :index]
  end 
  resources :categories do 
    resources :schedules, only: [:new, :create, :index]
  end 
  resources :notes
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
