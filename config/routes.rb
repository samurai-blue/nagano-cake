Rails.application.routes.draw do

  devise_for :admins, controllers: {sessions: 'admins/sessions'}
  devise_for :customers, controllers: {sessions: 'customers/sessions'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"

  get "homes/about", to: "homes#about"

  resource :customer, only: [:show,:edit,:update] do
    collection do
      get 'out'
      patch 'withdraw'
    end
  end

end
