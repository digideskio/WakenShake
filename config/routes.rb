Rails.application.routes.draw do
  resources :charges
  get 'committee/index'
  get 'accountant/index'
  get 'admin/index'

  devise_for :dancers, controllers: { registrations: 'registrations' }
  get 'donations/registration_payment'
  get 'donations/create'
  get 'teams/index'
  get 'teams/create'
  get 'teams/new'
  get 'charges/new'
  get 'charges/create'
  get 'charges/index'
  get 'donations/index'
  get 'about/index'
  get 'about/committee'
  get 'home_page/index'
  get 'dancers/login'
  get 'dancers/set_staff'
  get 'dancers/set_admin'
  get 'admin/index'

  resources :dancers
  resources :teams
  resources :histories
  resources :donations

  root 'home_page#index'
end
