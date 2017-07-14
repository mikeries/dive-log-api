Rails.application.routes.draw do
  root 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/github/callback' => 'sessions#create'
  
  get '/authenticate' => 'sessions#authenticate'
end
