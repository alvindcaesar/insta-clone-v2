class Api::UsersController < ApplicationController
  def username_exists
    user = User.find_by(username: params[:username])
    if user
      render json: { user_exist: true }
    else
      render json: { user_exist: false }
    end
  end
end
