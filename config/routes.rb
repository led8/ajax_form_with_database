Rails.application.routes.draw do
  root to: 'pages#home'

  get "test/:privacy_notice_id", to: "pages#test", as: "test"

  # Privacy Notice
  resources :privacy_notices, only: [:index, :new, :create, :show]

  # Template routes
  get "/privacy_notices/:privacy_notice_id/template_one", to: "privacy_notices#template_one", as: "template_one", format: 'docx'
  get "/privacy_notices/:privacy_notice_id/template_two", to: "privacy_notices#template_two", as: "template_two", format: 'docx'
end
