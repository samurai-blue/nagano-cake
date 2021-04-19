Rails.application.routes.draw do

  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"

  get "homes/about", to: "homes#about"

  resource :customer, only: [:show,:edit,:update,:out]
  get "customer/out", to: "customers#out"

end
