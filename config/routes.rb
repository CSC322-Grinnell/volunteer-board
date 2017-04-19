Rails.application.routes.draw do

   

  get 'events/new'

  devise_for :organizations, controllers: { registrations: 'organizations/registrations', sessions: 'organizations/sessions' }
  as :organization do
    get 'sign_in', to: 'organizations/sessions#new'
    get 'sign_up', to: 'organizations/registrations#new'
    get 'sign_out', to: 'organizations/sessions#destroy'
  end

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  as :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_out', to: 'users/sessions#destroy'
  end
  
  get 'users/:id', to: 'users/profile#show'


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'static_pages/home'

  root 'static_pages#home'

  #root 'application#volunteer_board'
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
