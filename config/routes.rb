Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :watches
  namespace :my do
    resources :watches
    resources :bookings
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
