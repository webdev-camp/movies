Rails.application.routes.draw do
  get 'visitor/index'
  get 'recommendations/index'
  root 'visitor#index'
  get 'home/movie'
  get 'person/:id', to: 'person#show'

  resources :movies, only: [:show, :index] do
    resources :reviews
  end
  resources :roles
  devise_for :users

  namespace :admin do
    resources :users
    resources :people
    resources :movies
  end
end
