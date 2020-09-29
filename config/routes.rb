Rails.application.routes.draw do
  post 'proposals/:proposal_id/votes', to: 'votes#create'
  get 'proposals/:proposal_id/votes', to: 'votes#index'
  get 'proposals/:proposal_id/votes/mine', to: 'votes#mine'
  get 'proposals/:proposal_id/votes/:vote_id', to: 'votes#show'
  put 'proposals/:proposal_id/votes/:vote_id', to: 'votes#edit'
  delete 'proposals/:proposal_id/votes/:vote_id', to: 'votes#delete'
  
  post 'proposals/:proposal_id/comments', to: 'comments#create'
  get 'proposals/:proposal_id/comments', to: 'comments#index'
  get 'proposals/:proposal_id/comments/:comment_id', to: 'comments#show'
  put 'proposals/:proposal_id/comments/:comment_id', to: 'comments#edit'
  delete 'proposals/:proposal_id/comments/:comment_id', to: 'comments#delete'

  post 'proposals', to: 'proposals#create'
  get 'proposals', to: 'proposals#index'
  get 'proposals/:proposal_id', to: 'proposals#show'
  put 'proposals/:proposal_id', to: 'proposals#edit'
  delete 'proposals/:proposal_id', to: 'proposals#delete'

  post 'delegations', to: 'delegations#create'
  get 'delegations', to: 'delegations#show'
  delete 'delegations', to: 'delegations#delete'

  post 'authenticate', to: 'authentication#authenticate'
  post 'registration', to: 'users#create'
  get 'users', to: 'users#index'
end
