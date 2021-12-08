class Friendship < ApplicationRecord
  enum status: [:pending, :accepted]

  belongs_to :user
end
