Rails.application.routes.draw do

  devise_for :admins, controllers: {sessions: 'admins/sessions'}

  devise_for :customers, controllers: {sessions: 'customers/sessions'}


  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
    resources :items,only: [:new, :index, :show, :edit, :update]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"

  get "homes/about", to: "homes#about"

  get 'orders/index'
  get 'orders/show'
  get 'orders/create'
  get 'orders/new'
  get 'orders/check'
  get 'orders/finish'

  resource :customer, only: [:show,:edit,:update] do
    collection do
      get 'out'
      patch 'withdraw'
    end
    resources :shippings, only: [:index, :create, :destroy, :update, :edit]
  end

  resources :genres
  resources :items
  resources :cart_items
end
