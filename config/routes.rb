Rails.application.routes.draw do
  devise_for :users
  namespace :admin do
  resources :users
  end
  scope '/admin' do

    resources :people
    resources :movies
  end
  root 'movies#index'
end
