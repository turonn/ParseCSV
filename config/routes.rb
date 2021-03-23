Rails.application.routes.draw do
  root to: 'home#index'

  post 'upload/import', to: 'upload#import', as: 'import_driving_records'
  resources :upload, only: [:index]

  resources :driving_records

  resources :drivers
end
