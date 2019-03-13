Rails.application.routes.draw do

  resources :welcomes
  get 'events/new'

  #sets up the links for all the user routes for devise
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  as :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'sign_out', to: 'users/sessions#destroy'
    get 'users/:id', to: 'users/profile#show', as: 'user_profile'
    get 'organizations/sign_up', to: 'users/registrations#new_org'
  end

  #sets up routes for sign in options
  get 'static_pages/signin_options'

  #sets up routes for sign up options
  get 'static_pages/signup_options'

  #sets up the routes for the profiles
  get 'users/:id', to: 'users/profile#show'

  #sets up the routes for listing all profiles
  get 'users', to: 'users/profile#list'
  get 'organizations', to: 'users/profile#list_org'

  #sets up the routes for registering and deregistering for an event as a user
  get 'events/sign_up/:id', to: 'events#sign_up'
  get 'events/deregister/:id', to: 'events#deregister'


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'static_pages/home'

  get '/admin/organizations/admin/organizations/:id/approve' => 'static_pages#approve_org', as: 'approve_org'

  root 'static_pages#home'

  #root 'application#volunteer_board'
  resources :events
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/faq' => 'static_pages#faq'

end
