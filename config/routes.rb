Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root 'home#homepage'
  get 'clap_vision', to: 'home#clap_vision'
  get 'clap_team', to: 'home#clap_team'
  get 'missions/dashboard', to: 'missions#dashboard'
  get 'organisations/:id/info', to: 'organisations#info', as: 'info_organisation'

  resources :contact, only: [:new, :create]

  resources :users, only: [:show, :edit, :update] do
    get 'missions', to: 'users#missions'
  end

  resources :missions, only: [:index]

  resources :organisations do
    get 'missions/:id/info', to: 'missions#info', as: 'info_mission'
    resources :missions, except: [:index] do
      resources :participations, only: [:create, :destroy]
    end
  end

end
