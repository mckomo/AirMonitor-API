Rails.application.routes.draw do
  resources :readings
  resources :measurements
  resources :stations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
