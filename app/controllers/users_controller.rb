class UsersController < ApplicationController
  skip_before_action :authenticate_request

  def create
    user = User.create!(name: params['user']['name'],
                        password: params['user']['password'],
                        password_confirmation: params['user']['password_confirmation'])

    if user
      render json: {
          status: :created,
          user: user
      }
    else
      render json: { status: 500 }
    end
  end
end
