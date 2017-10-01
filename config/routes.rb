Rails.application.routes.draw do
  get 'visitor/index'

  root 'visitor#index'
  get 'home/movie'

  resources :roles
  resources :reviews
  devise_for :users

  namespace :admin do
    resources :users
    resources :people
    resources :movies
  end
end
