Rails.application.routes.draw do
  root 'home#homepage'
  get 'index', to: 'home#index'
  get 'pages', to: 'home#pages'
  get 'contact', to: 'home#contact'
  get 'vision', to: 'home#vision'
  get 'operations', to: 'home#operations'
  get 'home/dashboard', to: 'home#dashboard'
  get 'home/organisationinfo', to: 'home#organisationinfo'

  get 'organisations/:id/info', to: 'organisations#info', as: 'info_organisation'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    get 'missions', to: 'users#missions'
  end
  resources :missions, only: [:index]

  resources :organisations do
    resources :missions, only: [:show, :new, :create] do
      resources :participations, only: [:create, :destroy]
    end
  end

end
