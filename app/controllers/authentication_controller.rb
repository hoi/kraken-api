class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:name], params[:password])

    if command.success?
      user = User.find_by(name: params[:name])
      render json: { id: user.id, auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
end
