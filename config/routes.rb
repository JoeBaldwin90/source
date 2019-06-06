Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Items controller
  resources :items

  # Users can sign up multiple times
  resources :users

  # Users can only make one session
  resource :session

  # Users can only edit one account
  resource :account

  # Multiple categories
  resources :categories

  get "about", to: "pages#about"

  # Homepage
  root "pages#home"

end
