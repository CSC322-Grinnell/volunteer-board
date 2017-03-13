Rails.application.routes.draw do
  resources :organizations
   root 'application#volunteerboard'
   get 'cities/:state', to: 'application#cities'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
