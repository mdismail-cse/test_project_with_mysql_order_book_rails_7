Rails.application.routes.draw do
  # get 'departments/index'
  # get 'departments/show'
  # get 'departments/new'
  # get 'departments/edit'
  # get 'departments/create'
  # get 'departments/update'
  # get 'departments/destroy'
  resources :departments
  resources :positions


  get 'ps_price/index'
  post 'ps_price/create'
  get 'ps_price/details'
  get 'ps_price/create_order', to: 'ps_price#create_order'
  resources :roles
  devise_for :stuffs
  resources :purchase_orders
  resources :products
  resources :suppliers

  # resources :ps_price
  get '/search', to: 'products#search', as: 'search'
  
  
  resources :stuffs do 
    collection do
      post :import
    end
  end





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "stuffs#index"
end
