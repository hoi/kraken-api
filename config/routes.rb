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

  post 'proposals/:proposal_id/amendments', to: 'proposal_amendments#create'
  get 'proposals/:proposal_id/amendments', to: 'proposal_amendments#index'
  get 'proposals/:proposal_id/amendments/:amendment_id', to: 'proposal_amendments#show'
  put 'proposals/:proposal_id/amendments/:amendment_id', to: 'proposal_amendments#edit'

  post 'proposals', to: 'proposals#create'
  get 'proposals', to: 'proposals#index'
  get 'proposals/:proposal_id', to: 'proposals#show'
  put 'proposals/:proposal_id', to: 'proposals#edit'
  delete 'proposals/:proposal_id', to: 'proposals#delete'

  get 'teams/:team_id/users', to: 'team_users#list'
  put 'teams/:team_id/users/:user_id/add', to: 'team_users#add'
  put 'teams/:team_id/users/:user_id/remove', to: 'team_users#remove'

  post 'teams', to: 'teams#create'
  get 'teams', to: 'teams#index'
  get 'teams/:team_id', to: 'teams#show'
  put 'teams/:team_id', to: 'teams#edit'
  delete 'teams/:team_id', to: 'teams#delete'

  post 'delegations', to: 'delegations#create'
  get 'delegations', to: 'delegations#show'
  delete 'delegations', to: 'delegations#delete'

  post 'authenticate', to: 'authentication#authenticate'
  post 'registration', to: 'users#create'
  get 'users', to: 'users#index'
end
