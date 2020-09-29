class VotesController < ApplicationController
  def create
    proposal = Proposal.find(params[:proposal_id])

    if proposal.nil?
      render json: { status: 404 } and return
    end

    vote = @current_user.votes.find_by(proposal: proposal)
    if vote.nil?
      vote = Vote.create!(value: params['vote']['value'],
                          proposal: proposal,
                          user: @current_user,
                          voter_id: @current_user.id)
    else
      vote.value = params['vote']['value']
      vote.voter_id = @current_user.id
      vote.save!
    end

    Delegation.where(delegate: @current_user.id).each do |delegation|
      delegate_vote = Vote.find_by(user_id: delegation.user_id, proposal: proposal)
      if delegate_vote.nil?
        Vote.create!(user: delegation.user, proposal: proposal, value: params['vote']['value'], voter_id: @current_user.id)
      elsif voter_id != delegation.user_id
        delegate_vote.value = params['vote']['value']
        delegate_vote.voter_id = @current_user.id
        delegate_vote.save!
      end
    end

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

  def mine
    vote = @current_user.votes.where(proposal_id: params[:proposal_id]).first

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
    vote.value = params['vote']['value']
    vote.voter_id = @current_user.id
    vote.save!

    Delegation.where(delegate: @current_user.id).each do |delegation|
      delegate_vote = Vote.find_by(user_id: delegation.user_id, proposal: proposal)
      if delegate_vote.nil?
        Vote.create!(user: delegation.user, proposal: proposal, value: params['vote']['value'], voter_id: @current_user.id)
      elsif voter_id != delegation.user_id
        delegate_vote.value = params['vote']['value']
        delegate_vote.voter_id = @current_user.id
        delegate_vote.save!
      end
    end

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
    proposal = Proposal.find(params[:proposal_id])

    if proposal.nil?
      render json: { status: 404 } and return
    end

    vote = Vote.find(params[:vote_id])
    vote.destroy!

    delegate_votes = Vote.where(proposal: proposal, voter_id: @current_user.id)
    delegate_votes.destroy_all

    render json: {
        status: :deleted
    }
  end
end
