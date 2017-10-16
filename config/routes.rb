Rails.application.routes.draw do
  resource :address, except: [:delete, :update, :edit, :index]
  devise_for :users
  authenticated :user do
    root 'discs#index', as: :authenticated_root
  end

  root 'visitor#index'
  get 'discs/for_sale', to:'discs#for_sale', as: 'discs_for_sale'
  get 'discs/wishlist', to:'discs#wishlist', as: 'discs_wishlist'
  get 'discs/shelf', to:'discs#shelf', as: 'discs_shelf'
  get 'discs/more_shelf', to:'discs#more_shelf', as: 'discs_more_shelf'
  get 'discs/index'
  get 'home/movie'
  get 'recommendations/index'
  get 'recommendations/create/:id', to: 'recommendations#create', as: 'recommendations_create'
  get 'recommendations/shelf/:id', to: 'recommendations#shelf', as: 'recommendations_shelf'
  get 'recommendation_wizard/index'
  get 'recommendation_wizard/create/:id', to: 'recommendation_wizard#create', as: 'recommendation_wizard_create'

  resources :movies, only: [:show] do
    member do
      get :sale_list
    end
  end
  resources :people, only: [:show]
  resources :discs, path: 'movies', except: [:create, :show, :update] do
    member do
      get :own
      get :hide
    end
    resource :review
    resource :dvd
    resource :purchase
  end

  namespace :admin do
    resources :roles
    resources :users
    resources :people
    resources :movies
  end
end
