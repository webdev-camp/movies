Rails.application.routes.draw do
  resources :roles
  resources :reviews
  devise_for :users
  namespace :admin do
  resources :users
  resources :people
  resources :movies
  end
  scope '/admin' do

  end
  root 'admin/movies#index'
end
