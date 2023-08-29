Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  resources :users do
    resources :reservations, only: [:index, :show, :create, :destroy]
  end
  resources :branches, only: [:index, :show]
end
