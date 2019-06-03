Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Items controller
  resources :items

  # User can sign up multiple times
  resources :users

  # User can only make one session
  resource :session

  # Multiple categories
  resources :categories

  get "about", to: "pages#about"

  # Homepage
  root "pages#home"

end
