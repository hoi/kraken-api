class DelegationsController < ApplicationController
  def create
    @current_user.delegations.destroy_all
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

  def show
    delegation = @current_user.delegations.first

    if delegation
      render json: {
          status: :found,
          delegation: delegation
      }
    else
      render json: { status: 404 }
    end
  end

  def delete
    @current_user.delegations.destroy_all

    render json: {
        status: :deleted
    }
  end
end
