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

  def index
    users = User.all

    if users
      render json: {
          status: :found,
          users: users.map{|user| {
              id: user.id,
              name: user.name
          }}
      }
    else
      render json: { status: 404 }
    end
  end
end
