Rails.application.routes.draw do
  root 'home#homepage'
  get 'index', to: 'home#index', as: 'index'
  get 'pages', to: 'home#pages', as: 'pages'


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

end
