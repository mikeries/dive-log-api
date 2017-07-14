Rails.application.routes.draw do
  root 'welcome#home'

  get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/github/callback' => 'sessions#create'
  
  post '/authenticate' => 'sessions#authenticate'
end
