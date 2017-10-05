Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'discs#index', as: :authenticated_root
  end
  get 'discs/index'
  get 'recommendations/index'
  get 'home/movie'

  get 'person/:id', to: 'person#show'


  root 'visitor#index'

  resources :discs, except: [:create, :update] do
    member do
      get :own
    end
    resource :review
    resource :dvd
  end

  resources :roles
  namespace :admin do
    resources :users
    resources :people
    resources :movies
  end
end
