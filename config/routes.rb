Rails.application.routes.draw do

  devise_for :admins, controllers: {sessions: 'admins/sessions'}

  devise_for :customers, controllers: {sessions: 'customers/sessions'}


  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
    resources :items,only: [:index, :show, :edit, :update, :new, :create ]
    resources :genres,only: [:index, :create, :edit, :update]
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"

  get "homes/about", to: "homes#about"

  resources :orders, only: [:index,:create,:show,:new] do
    collection do
      post 'check'
      get 'finish'
    end
  end

  resources :cart_items,only: [:index,:update,:create,:destroy] do
    collection do
      delete '/' => 'cart_items#all_destroy'
    end
  end

  resource :customer, only: [:show,:edit,:update] do
    collection do
      get 'out'
      patch 'withdraw'
    end
    resources :shippings, only: [:index, :create, :destroy, :update, :edit]
  end
  
  resources :items
<<<<<<< HEAD
  namespace :admin do
    resources :items,only: [:index, :show, :edit, :update]
    resources :genres,only: [:index, :edit, :update]
  end

  resources :shippings, only: [:index, :create, :destroy, :update, :edit]
=======
>>>>>>> origin/develop

  root "customer/items#top"

end
