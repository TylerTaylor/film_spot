Rails.application.routes.draw do
  # get 'static/index'
  root 'static#index'

  resources :roles
  
  resources :movies
  
  resources :directors do
    resources :movies
  end
  
  resources :actors
  
  #resources :viewings
  
  #resources :ratings
  
  devise_for :users

  resources :users do
    resources :viewings
  end
end
