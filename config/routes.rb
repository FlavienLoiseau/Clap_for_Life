Rails.application.routes.draw do
  root 'home#homepage'
  get 'index', to: 'home#index', as: 'index'
  get 'pages', to: 'home#pages', as: 'pages'


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
