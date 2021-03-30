Rails.application.routes.draw do
  get '/', to: 'application#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/google_oauth2/callback', to: 'session#google'
  resources :schedules do 
    resources :tasks, only: [:new, :create, :index]
  end 
  resources :tasks do 
    resources :notes, only: [:new, :create, :index]
  end 
  resources :categories
  resources :notes
  resources :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
