Rails.application.routes.draw do

  root to: 'backends#index'
  resources 'backends',only: [:index]
  namespace :backends do
    root to: 'backends#index'

    resource :sessions , only: [:create,:destroy]
    resources :systems,only: %w(edit update)
    resources :systems do
      collection do
        post :import_passenger_excel
        get :file_upload
      end
    end
    resources :passengers
    resources :passenger_infos
    resources :admins do
      collection do
        get :login
        get :confirm_page
        post :confirm_commit
      end
    end
    
  end
end
