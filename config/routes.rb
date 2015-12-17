Rails.application.routes.draw do

  scope 'api/v1' do

    get 'measurements/subjects', to: 'subjects#index', as: 'subjects'
    get 'measurements/norms', to: 'norms#index', as: 'norms'

    resources :stations

    resources :stations do
      resources :measurements, shallow: true
    end

  end

end
