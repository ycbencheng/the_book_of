class HomeController < ApplicationController
  def index
    friends = current_user.friends

    render json: { user: current_user, friends: friends, status: :success }
  end

  def add_friends
    email = friend_params[:email]

    friend = User.find_by(email: email) if current_user.email != email

    if friend
      current_user.invite(friend)

      render json: { status: :success }
    else
      render json: { status: :failed }
    end
  end

  private

  def friend_params
    params.require(:home).permit(:email)
  end
end
