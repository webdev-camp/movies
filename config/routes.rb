Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'home/movie'
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
