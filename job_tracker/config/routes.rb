Rails.application.routes.draw do
  root 'home#index'

  resources :home, only: [:index]
  resources :employers
  resources :job_applications
  #end
end
