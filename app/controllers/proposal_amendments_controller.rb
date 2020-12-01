class ProposalAmendmentsController < ApplicationController
  def create
    proposal = Proposal.find(params[:proposal_id])

    if proposal.nil?
      render json: { status: 404 } and return
    end

    proposal_amendment = ProposalAmendment.create!(text: params['amendment']['text'],
                                                   status: params['amendment']['status'],
                                                   proposal: proposal,
                                                   user: @current_user)

    if proposal_amendment
      render json: {
          status: :created,
          proposal_amendment: proposal_amendment
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
          proposal_amendments: proposal.proposal_amendments
      }
    else
      render json: { status: 404 }
    end
  end

  def show
    proposal_amendment = ProposalAmendment.find(params[:amendment_id])

    if proposal_amendment
      render json: {
          status: :found,
          proposal_amendment: proposal_amendment
      }
    else
      render json: { status: 404 }
    end
  end

  def edit
    proposal_amendment = ProposalAmendment.find(params[:amendment_id])
    proposal_amendment.text = params['amendment']['text']
    proposal_amendment.status = params['amendment']['status']
    proposal_amendment.save!

    if proposal_amendment
      render json: {
          status: :updated,
          proposal_amendment: proposal_amendment
      }
    else
      render json: { status: 500 }
    end
  end

  def delete
    proposal_amendment = ProposalAmendment.find(params[:amendment_id])
    proposal_amendment.destroy!

    render json: {
        status: :deleted
    }
  end
end
