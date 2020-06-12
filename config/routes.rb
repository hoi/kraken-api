Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  post 'registration', to: 'users#create'
end
