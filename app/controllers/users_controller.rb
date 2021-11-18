class UsersController < ApplicationController
  skip_before_action :authenticate_request

  # POST /auth/sign_up
  def create
    @user = User.new(user_params)

    if @user.save
      UserMailer.new_user_email(@user).deliver
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private def user_params
    params.permit(:name, :email, :password)
  end

end
