Rails.application.routes.draw do
  post 'proposals', to: 'proposals#create'
  get 'proposals/:id', to: 'proposals#show'
  put 'proposals/:id', to: 'proposals#edit'
  delete 'proposals/:id', to: 'proposals#delete'

  post 'authenticate', to: 'authentication#authenticate'
  post 'registration', to: 'users#create'
end
