Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :auth do
        resources :tokens, only: [:create]
      end

      post 'me', to: 'users#create', as: 'registration'
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
