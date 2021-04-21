Rails.application.routes.draw do
 
  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  devise_for :customers, controllers: {sessions: 'customers/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"

  get "homes/about", to: "homes#about"
  
  # resource :shippings, only: [:create, :index, :destroy, :update, :edit]
  post "shippings" =>"shippings#create"
  get 'shippings/index'
  get 'shippings/:id/edit' => 'shippings#edit', as: 'edit_shipping'
  patch 'shippings/:id' => 'shippings#update', as: 'update_shipping'
  delete 'shippings/:id' => 'shippings#destroy', as: 'destroy_shipping'
  
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
end
