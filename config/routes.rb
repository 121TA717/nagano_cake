Rails.application.routes.draw do
   get '/top' => 'homes#top'
  
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }


  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  namespace :admin do
   get '/' => 'homes#top'

  #resources :sessions, only: [:new, :create, :destroy]
  resources :items
  resources :genres, only: [:index, :create, :edit, :update]
  resources :customers, only: [:index, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
