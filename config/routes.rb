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
  
  get '/charges', to: 'charges#index'
  get '/charges/:id', to: 'charges#show'
  get '/charges/new', to: 'charges#new'
  get '/charges/registration_fee', to: 'charges#registration_fee'
  post '/charges', to: 'charges#create'
  patch '/charges/:id', to: 'charges#update'
  put '/charges/:id', to: 'charges#update'
  delete '/charges/:id', to: 'charges#destroy'

  resources :dancers
  resources :teams
  resources :histories
  root 'home_page#index'


end
