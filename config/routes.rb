Rails.application.routes.draw do
  resources :hospitals

  root 'dashboards#index'
  
end
