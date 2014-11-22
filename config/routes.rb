Rails.application.routes.draw do

  # Mercury::Engine.routes
  if Rails.env.production?
    devise_for :users, :controllers => { :registrations => "registrations" }
  else
    devise_for :users
  end

  namespace :backend do
    resources :products do
    	post :image_upload, on: :member
    	delete :remove_image, on: :member
      get :upload, on: :member
    	# get :search, on: :collection
    end
    resources :news

    resources :images
    resources :contacts
    resources :inboxes
    resources :settings, :only => [:edit, :update]
    root to: 'products#index'
  end

  resources :home, :only => [:index]
  resources :products, only: [:index, :show] do
    get 'zones/:zone_id' => 'products#zone', on: :collection, as: :zone
    get 'search' => 'products#index', on: :collection
    post 'search' => 'products#index', on: :collection
    post 'message' => 'products#message', on: :member
  end

  resources :news, only: [:index, :show] do
    get 'search'=> 'news#index', on: :collection
    post 'search'=> 'news#index', on: :collection
  end

  resources :contacts, only: [:index, :create]

  root to: 'products#index'
end
