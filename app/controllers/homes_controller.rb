class HomesController < ApplicationController
  def index
    friends = current_user.friends

    render json: { user: current_user, friends: friends, status: :success }
  end

  def add_friends
    email = friend_params[:email]

    friend = User.find_by(email: email) if current_user.email != email

    if current_user.invite(friend)
      render json: { status: :success }
    else
      render json: { status: :failed }
    end
  end

  def delete_friends
    friendship = current_user.friendships.find_by(friend_id: friend_params[:id])

    if friendship.destroy
      render json: { status: :success }
    else
      render json: { status: :failed }
    end
  end

  private

  def friend_params
    params.require(:home).permit(:id, :email)
  end
end
