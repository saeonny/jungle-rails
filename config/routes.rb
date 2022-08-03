Rails.application.routes.draw do
  # root : is / home page 
  root to: 'products#index' # parse to controller 



  get 'users/new' => 'users#new', as: :new_user
  post 'users' => 'users#create'


	get '/login'     => 'sessions#new'


	post '/login'    => 'sessions#create'


	delete '/logout' => 'sessions#destroy'  
   
  #endpoint as product 
  resources :about, only: [:index]
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end


end
