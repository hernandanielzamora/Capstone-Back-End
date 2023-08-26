Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :reservations, only: [:index, :show, :create, :destroy]
  end
end
