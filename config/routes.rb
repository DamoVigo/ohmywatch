Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :watches do
    resources :bookings, only: [:new, :create, :show, :destroy]
  end
  namespace :my do
    resources :watches
  end
  resources :bookings, except: [:new, :create, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
