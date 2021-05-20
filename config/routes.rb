Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :watches do
    resources :bookings
  end
  namespace :my do
    resources :watches
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
