Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root 'discs#index', as: :authenticated_root
  end
  root 'visitor#index'

  get 'discs/index'
  get 'home/movie'
  get 'recommendations/index'
  get 'recommendation_wizard/index'
  get 'recommendation_wizard/create/:id', to: 'recommendation_wizard#create', as: 'recommendation_wizard_create'
  get 'person/:id', to: 'person#show'

  resources :discs, path: 'movies', except: [:create, :update] do
    member do
      get :own
      get :hide
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
