Rails.application.routes.draw do

  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  devise_for :customers, controllers: {sessions: 'customers/sessions'}
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
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :genres
  resources :items
  namespace :admin do
    resources :items,only: [:index, :show, :edit, :update]
  end

  resources :shippings, only: [:index, :create, :destroy, :update, :edit]


end
