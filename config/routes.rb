Rails.application.routes.draw do

  root to: 'backends#index'
  resources 'backends',only: [:index]
  namespace :backends do
    root to: 'backends#index'

    resource :sessions , only: [:create,:destroy]
    resources :systems,only: %w(edit update)
    resources :passengers
    resources :admins do
      collection do
        get :login
        get :confirm_page
        post :confirm_commit
      end
    end
    
  end
end
