Rails.application.routes.draw do
  resources :relationships, only: [:index, :create]
  resource :address, except: [:delete, :update, :edit, :index]
  devise_for :users
  authenticated :user do
    root 'cards#index', as: :authenticated_root
  end

  # TODO Do not delete!
  # resources :users, only: [:show] do
  #   member do
  #     get :following, :followers
  #   end
  # end

  resource :my, only: [:index] do
    collection do
      get :for_sale
      get :shelf
      get :home
      get :wishlist
      get :more_shelf
      get :hidden_list
    end
  end

  resources :recommendations, only: [:index] do
    member do
      get :shelf
      get :make
    end
  end


  root 'visitor#index'
  get 'recommendation_wizard/index'
  get 'recommendation_wizard/create/:id', to: 'recommendation_wizard#create', as: 'recommendation_wizard_create'

  resources :charges
  resources :movies, path: 'movie', only: [:show] do
    member do
      get :sale_list
      get :own
      get :wish
      get :hide
    end
  end
  resources :people, only: [:show]
  resources :cards, path: 'movies', except: [:create, :show, :update] do
    member do

    end

    resource :review
    resource :dvd
    resource :purchase, only: [:create]
  end

  namespace :admin do
    resources :roles
    resources :users
    resources :people
    resources :movies
  end
end
