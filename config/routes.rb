Rails.application.routes.draw do
  get 'committee/index'
  get 'accountant/index'
  get 'admin/index'
  get 'charges/registration_fee'
  get 'about/index'
  get 'about/committee'
  get 'home_page/index'
  get 'dancers/login'
  get 'dancers/set_staff'
  get 'dancers/set_admin'

  devise_for :dancers, controllers: { registrations: 'registrations' }
  resources :charges
  resources :dancers
  resources :teams
  resources :histories
  root 'home_page#index'


end
