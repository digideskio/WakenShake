Rails.application.routes.draw do
  resources :sponsors
  resources :champions
  resources :events
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
  get 'dancers/set_committee'
  post 'dancers/send_donation_email'
  match '/send_mass_email', to: 'admin#mass_mailer', via: 'post'

  devise_for :dancers, controllers: { registrations: 'registrations' }
  
  resources :charges, except: [:create]
  post 'charges', to: 'charges#create', constraints: {host: "ENV['PAYMENTURL']"}
  
  resources :dancers
  resources :teams
  resources :histories
  root 'home_page#index'


end
