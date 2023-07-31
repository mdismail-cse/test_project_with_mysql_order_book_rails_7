Rails.application.routes.draw do
  resources :roles
  devise_for :stuffs
  resources :purchase_orders
  resources :products
  resources :suppliers
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
