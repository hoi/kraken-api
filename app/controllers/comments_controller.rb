class CommentsController < ApplicationController
  def create
    proposal = Proposal.find(params[:proposal_id])

    if proposal.nil?
      render json: { status: 404 } and return
    end

    comment = Comment.create!(body: params['comment']['body'],
                              proposal: proposal,
                              user: @current_user)

    if comment
      render json: {
          status: :created,
          comment: comment
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
          comments: proposal.comments
      }
    else
      render json: { status: 404 }
    end
  end

  def show
    comment = Comment.find(params[:comment_id])

    if comment
      render json: {
          status: :found,
          comment: comment
      }
    else
      render json: { status: 404 }
    end
  end

  def edit
    comment = Comment.find(params[:comment_id])
    comment.title = params['comment']['title']
    comment.title = params['comment']['body']
    comment.save!

    if comment
      render json: {
          status: :updated,
          comment: comment
      }
    else
      render json: { status: 500 }
    end
  end

  def delete
    comment = Comment.find(params[:comment_id])
    comment.destroy!

    render json: {
        status: :deleted
    }
  end
end
