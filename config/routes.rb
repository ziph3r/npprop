Rails.application.routes.draw do
  
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
    root to: 'products#index'
  end

  resources :home, :only => [:index]
  resources :products, only: [:index, :show] do 
    get 'zones/:zone_id' => 'products#zone', on: :collection, as: :zone
  end

  resources :news, only: [:index, :show] 

  resources :contacts, only: [:index, :create] 

  root to: 'home#index'
end
