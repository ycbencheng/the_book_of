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
end
