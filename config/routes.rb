Rails.application.routes.draw do
  root 'home#homepage'
  get 'index', to: 'home#index'
  get 'pages', to: 'home#pages'
  get 'contact', to: 'home#contact'
  get 'vision', to: 'home#vision'
  get 'operations', to: 'home#operations'
  get 'home/missions', to: 'home#missions'
  get 'home/organisationinfo', to: 'home#organisationinfo'
  get 'home/organisationedit', to: 'home#organisationedit'
  get 'home/dashboard', to: 'home#dashboard'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :missions, only: [:index, :new]

  resources :organisations, only: [:index, :show, :new, :create] do
    resources :missions, only: [:show] do
      resources :participations, only: [:create, :destroy]
    end
  end

end
