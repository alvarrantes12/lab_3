Rails.application.routes.draw do
  resources :hospitals
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'dashboards#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
