Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/github/callback' => 'sessions#create'
  
  get '/authenticate' => 'sessions#authenticate'
  get '/user/current_user' => 'sessions#get_current_user'

  resources :dives, only: [:index, :create, :update, :destroy]
  resources :locations, only: [:index]
end
