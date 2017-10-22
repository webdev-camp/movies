Rails.application.routes.draw do
  resource :address, except: [:delete, :update, :edit, :index]
  devise_for :users
  authenticated :user do
    root 'cards#index', as: :authenticated_root
  end

  resource :my do
    collection do
      get :for_sale
      get :shelf
    end
  end
  root 'visitor#index'
  get 'cards/more_shelf', to:'cards#more_shelf', as: 'cards_more_shelf'
  get 'cards/index'
  get 'recommendations/index'
  get 'recommendations/create/:id', to: 'recommendations#create', as: 'recommendations_create'
  get 'recommendations/shelf/:id', to: 'recommendations#shelf', as: 'recommendations_shelf'
  get 'recommendation_wizard/index'
  get 'recommendation_wizard/create/:id', to: 'recommendation_wizard#create', as: 'recommendation_wizard_create'

  resources :charges
  resources :movies, path: 'movie', only: [:show] do
    member do
      get :sale_list
    end
  end
  resources :people, only: [:show]
  resources :cards, path: 'movies', except: [:create, :show, :update] do
    member do
      get :own
      get :hide
    end
    collection do
      get :wishlist
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
