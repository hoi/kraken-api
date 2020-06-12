Rails.application.routes.draw do
  post 'proposals/:proposal_id/comments', to: 'comments#create'
  get 'proposals/:proposal_id/comments/:comment_id', to: 'comments#show'
  put 'proposals/:proposal_id/comments/:comment_id', to: 'comments#edit'
  delete 'proposals/:proposal_id/comments/:comment_id', to: 'comments#delete'

  post 'proposals', to: 'proposals#create'
  get 'proposals/:proposal_id', to: 'proposals#show'
  put 'proposals/:proposal_id', to: 'proposals#edit'
  delete 'proposals/:proposal_id', to: 'proposals#delete'

  post 'authenticate', to: 'authentication#authenticate'
  post 'registration', to: 'users#create'
end
