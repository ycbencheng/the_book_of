class Friendship < ApplicationRecord
  acts_as_paranoid

  enum status: [:pending, :accepted]

  belongs_to :user
end
