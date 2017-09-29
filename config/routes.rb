Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  scope '/admin' do
    resources :users
    resources :people
    resources :movies
  end
  root 'movies#index'
end
