class Entry < ApplicationRecord
  acts_as_paranoid

  validates :body, presence: true

  belongs_to :user
end
