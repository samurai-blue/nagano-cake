Rails.application.routes.draw do

  # 管理者側のrouting
devise_scope :admins do
    devise_for :admins, controllers: {
        registrations: 'admins/registrations',
        passwords: 'admins/passwords',
        sessions: 'admins/sessions'
    }
end

namespace :admins do
    get 'homes/top' => 'homes#top', as:'top'
    resources :customers,only: [:index,:show,:edit,:update]
    resources :items, only: [:index, :create, :new, :edit, :show, :update]
    resources :orders, only: [:index, :create, :show, :update]
    resources :order_details, only: [:index, :create, :show, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    get 'search' => 'searches#search', as: 'search'
end
  
  

  
  devise_for :customers, controllers: {
    registrations: 'customers/registrations',
    passwords: 'customers/passwords',
    sessions: 'customers/sessions'}

  
get 'homes/top' => 'homes#top', as: 'customer_top'
get 'homes/about' => 'homes#about', as: 'customer_about'
resources :orders, only: [:new, :index, :create, :show]
  post 'orders/check' => 'orders#check', as: 'order_check'
  get 'orders/finish' => 'orders#finish', as: 'order_finish'
resources :items, only: [:index, :show]
resources :order_details, only: [:index, :create, :new]
resources :shippings, only: [:index, :create, :edit, :update, :destroy]
resources :genres

#カートアイテムを全て削除メソッドのために追加
resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
        delete 'all_destroy'
    end
end







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root "homes#top"

  # get "homes/about", to: "homes#about"

  # resources :orders, only: [:index,:create,:show,:new] do
  #   collection do
  #     post 'check'
  #     get 'finish'
  #   end
  # end

  # resources :cart_items,only: [:index,:update,:create,:destroy] do
  #   collection do
  #     delete '/' => 'cart_items#all_destroy'
  #   end
  # end

   resource :customer, only: [:show,:edit,:update] do
     collection do
       get 'out'
       patch 'withdraw'
     end
     resources :shippings, only: [:index, :create, :destroy, :update, :edit]
   end
  
  # resources :items

#   root "customer/items#top"

end

