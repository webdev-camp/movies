Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  namespace :admin do
  resources :users
  resources :people
  end
  scope '/admin' do
    resources :movies
  end
  root 'movies#index'
end
