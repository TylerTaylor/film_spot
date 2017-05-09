Rails.application.routes.draw do
  root 'static#index'
  get 'movies/most_viewed' => 'movies#most_viewed_movies', as: 'most_viewed_movies'
  get 'users/:user_id/viewed_movies' => 'movies#movies_viewed_by_user', as: 'user_viewed_movies'
  
  get 'api/movies' => 'movies#api_index'
  get 'movies/random_movie_picker' => 'movies#movie_picker_api', as: 'random_movie_picker'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
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
