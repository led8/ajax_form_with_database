Rails.application.routes.draw do
  root to: 'pages#home'

  get "test", to: "pages#test", as: "test"

  # Privacy Notice
  resources :privacy_notices, only: [:index, :new, :create, :show]
end
