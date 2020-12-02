Rails.application.routes.draw do
  root 'home#homepage'
  get 'index', to: 'home#index'
  get 'pages', to: 'home#pages'
  get 'contact', to: 'home#contact'
  get 'missions', to: 'home#missions'


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

end
