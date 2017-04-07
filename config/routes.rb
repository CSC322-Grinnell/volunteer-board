Rails.application.routes.draw do
   
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'static_pages/home'

  root 'static_pages#home'

  #root 'application#volunteer_board'
  resources :organizations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
