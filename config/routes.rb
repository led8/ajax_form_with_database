Rails.application.routes.draw do
  root to: 'pages#home'

  # Privacy Notice
  resources :privacy_notices, only: [:new, :create, :show]
end
