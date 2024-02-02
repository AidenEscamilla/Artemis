Rails.application.routes.draw do
  resources :job_descriptions, except: [:destroy]
  root 'home#index'

  resources :home, only: [:index]
  resources :employers
  resources :job_applications
  #end
end
