Rails.application.routes.draw do
  root 'home#index'

  resources :employers
  resources :home, only: [:index]
  #end
end
