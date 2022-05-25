Rails.application.routes.draw do
  resources :appointments
  resources :patients
  resources :doctors
  resources :hospitals

  root 'dashboards#index'

  
end
