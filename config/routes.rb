Rails.application.routes.draw do
  resources :organizations
   root 'application#volunteerboard'
end
