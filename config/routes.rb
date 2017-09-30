Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  namespace :admin do
    resources :users
    resources :people
    resources :movies
  end
  root 'admin/movies#index'
end
