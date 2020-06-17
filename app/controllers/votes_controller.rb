class VotesController < ApplicationController
  def create
    proposal = Proposal.find(params[:proposal_id])

    if proposal.nil?
      render json: { status: 404 } and return
    end

    vote = Vote.create!(value: params['vote']['value'],
                              proposal: proposal,
                              user: @current_user)

    if vote
      render json: {
          status: :created,
          vote: vote
      }
    else
      render json: { status: 500 }
    end
  end

  def index
    proposal = Proposal.find(params[:proposal_id])

    if proposal
      render json: {
          status: :found,
          votes: proposal.votes
      }
    else
      render json: { status: 404 }
    end
  end

  def show
    vote = Vote.find(params[:vote_id])

    if vote
      render json: {
          status: :found,
          vote: vote
      }
    else
      render json: { status: 404 }
    end
  end

  def edit
    vote = Vote.find(params[:vote_id])
    vote.title = params['vote']['title']
    vote.title = params['vote']['body']
    vote.save!

    if vote
      render json: {
          status: :updated,
          vote: vote
      }
    else
      render json: { status: 500 }
    end
  end

  def delete
    vote = Vote.find(params[:vote_id])
    vote.destroy!

    render json: {
        status: :deleted
    }
  end
end
