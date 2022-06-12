Rails.application.routes.draw do
   root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  get '/customers/my_page' => 'public/customers#show'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw'
  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
  post '/orders/comfirm' => 'public/orders#/orders/comfirm'
  get '/orders/complete' => 'public/orders#complete'

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  namespace :public do
  resources :items, only: [:index, :show]
  resource :customers, only: [:edit, :update]
  resource :cart_items, only: [:index, :update, :destroy, :create]
  resource :orders, only: [:new, :create, :index, :show]
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  resources :registrations, only: [:new, :create]
  end


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  namespace :admin do

  #resources :sessions, only: [:new, :create, :destroy]
  resources :items
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
