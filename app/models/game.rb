class Game < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { minimum: 4}
  validates :rating, presence: true
  validates :review, presence: true

  RATINGS = {
    'one star': '1_star',
    'two stars': '2_stars',
    'three stars': '3_stars',
    'four stars': '4_stars',
    'five stars': '5_stars'
    }

    def humanized_rating
      RATINGS.invert[self.rating]
    end

end
