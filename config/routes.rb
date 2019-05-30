Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # User can sign up multiple times
  resources :users

  # User can only make one session
  resource :session


  get "about", to: "pages#about"

  # Homepage
  root "pages#home"

end
