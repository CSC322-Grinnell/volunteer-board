Rails.application.routes.draw do
  resources :organizations
   root 'application#volunteerboard'
   get 'cities/:state', to: 'application#cities'
end
