Rails.application.routes.draw do
  
  
  # resource :shippings, only: [:create, :index, :destroy, :update, :edit]
  post "shippings" =>"shippings#create"
  get 'shippings/index'
  # get 'shippings/destroy'
  # get 'shippings/update'
  # get 'shippings/edit'
  
  get 'orders/index'
  get 'orders/show'
  get 'orders/create'
  get 'orders/new'
  get 'orders/check'
  get 'orders/finish'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
