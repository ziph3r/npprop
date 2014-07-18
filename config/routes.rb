Rails.application.routes.draw do
  
  devise_for :users
  namespace :backend do 
    resources :products do 
    	post :image_upload, on: :member
    	delete :remove_image, on: :member
    	# get :search, on: :collection
    end
    resources :news
    resources :images
    resources :contacts
    resources :inboxes
    root to: 'products#index'
  end

  resources :products, only: [:index, :show] do 
    get 'zones/:zone_id' => 'products#zone', on: :collection, as: :zone
  end

  resources :news, only: [:index, :show] 

  resources :contacts, only: [:index, :create] 

  root to: 'products#index'
end
