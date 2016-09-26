Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      get 'me', to: 'users#show', as: 'current_user'

      resources :subjects, only: [:index]
      resources :norms, only: [:index]

      resources :channels, param: :code do
        resources :measurements, shallow: true
      end

      resources :stations, param: :code do
        get 'nearest', on: :collection
        resources :channels, shallow: true
      end

    end

    match '*unmatched_route', :to => 'endpoint#endpoint_not_found', :via => :all

  end

end
