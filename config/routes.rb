Rails.application.routes.draw do
  scope module: :api, path: "api" do
    resources :medicines
  end
  resources :appointments
  resources :patients
  resources :doctors
  resources :hospitals
  root "dashboards#index"
end
