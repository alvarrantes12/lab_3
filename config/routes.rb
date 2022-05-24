Rails.application.routes.draw do
  resources :doctors
  resources :hospitals
  root "dashboards#index"
end
