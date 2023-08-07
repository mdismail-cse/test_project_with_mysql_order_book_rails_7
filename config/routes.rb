Rails.application.routes.draw do

  resources :asset_stuffs
  resources :company_assets
  resources :asset_types

  resources :departments
  resources :positions
  resources :roles
  devise_for :stuffs
  resources :purchase_orders
  resources :products
  resources :suppliers


  resources :stuffs do
    collection do
      post :import
    end
  end


  # patch 'update_status', to: 'asset_stuffs#update', as: :update_status
  post 'asset_stuffs/create_asset_assign', to: 'asset_stuffs#create'
  get 'ps_price/index'
  post 'ps_price/create'
  get 'ps_price/details'
  get 'ps_price/create_order', to: 'ps_price#create_order'

  # resources :ps_price
  get '/search', to: 'products#search', as: 'search'
  

   root "stuffs#index"
end
