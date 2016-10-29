Rails.application.routes.draw do
  # get 'static/index'
  root 'static#index'
  get 'movies/most_viewed' => 'movies#most_viewed_movies', as: 'most_viewed_movies'

  devise_for :users
  resources :users do
    resources :viewings
  end

  resources :roles  
  resources :movies  

  resources :directors do
    resources :movies
  end  
  
  resources :actors  


end
