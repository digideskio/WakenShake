Rails.application.routes.draw do
  get 'accountant/index'

  get 'admin/index'

  devise_for :dancers, controllers: { registrations: 'registrations' }

  get 'teams/index'
  get 'teams/create'
  get 'teams/new'
  get 'charges/new'
  get 'charges/create'
  get 'charges/index'
  get 'donations/index'
  get 'about/index'
  get 'home_page/index'
  get 'dancers/login'
  get 'dancers/set_staff'
  get 'dancers/set_admin'
  get 'admin/index'

  resources :dancers
  resources :charges
  resources :teams
  resources :histories

  root 'home_page#index'
end
