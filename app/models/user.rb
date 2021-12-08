class User < ApplicationRecord
  acts_as_paranoid

  include Devise::JWT::RevocationStrategies::Allowlist

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :jwt_authenticatable, jwt_revocation_strategy: self

  validates :first_name, :last_name, presence: true

  has_one_attached :image, dependent: :destroy

  has_many :friendships, class_name: 'Friendship', dependent: :destroy

  def friends
    accepted = friendships.where(status: :accepted).pluck(:friend_id)
    User.where(id: accepted)
  end

  def invite(friend)
    friendship.create(friend_id: friend.id)
  end
end
