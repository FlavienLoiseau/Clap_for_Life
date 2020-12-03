Rails.application.routes.draw do
  root 'home#homepage'
  get 'index', to: 'home#index'
  get 'pages', to: 'home#pages'
  get 'contact', to: 'home#contact'
  get 'vision', to: 'home#vision'
  get 'operations', to: 'home#operations'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :missions, only: [:index]
  resources :organisations, only: [:index, :show] do
    resources :missions, only: [:show]
  end

end
