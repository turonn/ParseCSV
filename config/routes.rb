Rails.application.routes.draw do
  root to: 'home#index'

  post 'upload/import', to: 'upload#import', as: 'import_driving_records'
  resources :upload, only: [:index]

  delete 'driving_records/clear_database', to: 'driving_records#clear_database', as: 'clear_database'
  resources :driving_records

  resources :drivers
end
