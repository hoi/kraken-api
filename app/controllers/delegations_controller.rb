class DelegationsController < ApplicationController
  def create
    delegate = User.find(params['delegation']['delegate_id'])

    if delegate.nil?
      render json: { status: 404 } and return
    end

    delegation = Delegation.create_or_find_by!(delegate: params['delegation']['delegate_id'],
                                               user: @current_user)

    if delegation
      render json: {
          status: :created,
          delegation: delegation
      }
    else
      render json: { status: 500 }
    end
  end

  def index
    render json: {
        status: :found,
        delegations: @current_user.delegations
    }
  end

  def delete
    delegation = @current_user.delegations.where(delegate: params[:delagate_id]).first
    delegation.destroy!

    render json: {
        status: :deleted
    }
  end
end
