class ProposalsController < ApplicationController
  def create
    proposal = Proposal.create!(title: params['proposal']['title'],
                                body: params['proposal']['body'],
                                user: @current_user)

    if proposal
      render json: {
          status: :created,
          proposal: proposal
      }
    else
      render json: { status: 500 }
    end
  end

  def index
    proposals = Proposal.all

    if proposals
      render json: {
          status: :found,
          proposals: proposals
      }
    else
      render json: { status: 404 }
    end
  end

  def show
    proposal = Proposal.find(params[:proposal_id])

    if proposal
      render json: {
          status: :found,
          proposal: proposal
      }
    else
      render json: { status: 404 }
    end
  end

  def edit
    proposal = Proposal.find(params[:proposal_id])
    proposal.title = params['proposal']['title']
    proposal.title = params['proposal']['body']
    proposal.save!

    if proposal
      render json: {
          status: :updated,
          proposal: proposal
      }
    else
      render json: { status: 500 }
    end
  end

  def delete
    proposal = Proposal.find(params[:proposal_id])
    proposal.destroy!

    render json: {
        status: :deleted
    }
  end
end
