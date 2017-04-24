class Game < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: { minimum: 4}
  validates :address, presence: true
  validates :review, presence: true, length: {minimum: 10}


end
