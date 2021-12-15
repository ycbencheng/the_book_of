class UsersController < ApplicationController
  def index
    render json: { user: current_user.info, status: :success }
  end

  def update
    if current_user.update(user_params)
      render json: { status: :success }
    else
      render json: { status: :failed }
    end
  end

  private

  def user_params
    params.require(:user).permit(:id,
                                 :first_name,
                                 :last_name,
                                 :email,
                                 :password)
  end
end
