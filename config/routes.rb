Rails.application.routes.draw do
  root to: 'driving_records#index'

  resources :upload, only: [:index]
end
