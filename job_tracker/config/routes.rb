Rails.application.routes.draw do
  root "employers#index"
  resources :employers
  #root "articles#index"

  #resources :articles do
    
  #end
end
