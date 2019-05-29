Rails.application.routes.draw do

  # User can sign up multiple times
  resources :users

  # User can only make one session
  resource :session


  get "about", to: "pages#about"

  # Homepage
  root "pages#home"

end
