Rails.application.routes.draw do

  root to: "home#index"

  devise_for :users

  devise_scope :user do
    get "sign_up", to: "devise/registrations#new"
    get "sign_in", to: "devise/sessions#new"
    get "sign_out", to: "devise/sessions#destroy"
  end

  namespace :api do
    namespace :v1 do

      namespace :auth do
        resources :tokens, only: [:create]
      end

      get 'me', to: 'users#show', as: 'current_user'

      resources :stations
      resources :subjects, only: [:index]
      resources :norms, only: [:index]

      resources :stations do
        resources :measurements, shallow: true
      end

    end

  end

end
