Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :auth do
        resources :tokens, only: [:create]
      end

      post 'me', to: 'users#create', as: 'registration'
      get 'me', to: 'users#show', as: 'current_user'

      get 'measurements/subjects', to: 'subjects#index', as: 'subjects'
      get 'measurements/norms', to: 'norms#index', as: 'norms'

      resources :stations

      resources :stations do
        resources :measurements, shallow: true
      end

    end

  end

end
