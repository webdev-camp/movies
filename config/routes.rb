Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'movies#index', as: :authenticated_root
  end
  get 'movies/index'
  get 'recommendations/index'
  get 'home/movie'

  get 'person/:id', to: 'person#show'


  root 'visitor#index'

  resources :movies, only: [:show, :index] do
    resource :review
    resource :dvds
  end
  
  resources :roles
  namespace :admin do
    resources :users
    resources :people
    resources :movies
  end
end
