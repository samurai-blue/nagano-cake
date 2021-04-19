Rails.application.routes.draw do
  devise_for :users

  # ジャンルのURLを「admin/genres」にする
  scope :admin do
    resources :genres
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :genres
  resources :items
end

