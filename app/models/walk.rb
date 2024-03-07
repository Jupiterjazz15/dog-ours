class Walk < ApplicationRecord
  DIFFICULTIES = %w[low medium intense]
  FREQUENCIES = ["once", "every day", "every other day"]

  belongs_to :user
  belongs_to :parent, foreign_key: :parent_id, class_name: 'Walk', optional: true

  has_many :bookings, dependent: :destroy
<<<<<<< HEAD
  has_many :walks, foreign_key: :parent_id, class_name: "Walk"
=======
  has_many :walks, foreign_key: :parent_id, class_name: "Walk", dependent: :destroy
>>>>>>> origin

  validates :difficulty, inclusion: { in: DIFFICULTIES }
  validates :frequency, inclusion: { in: FREQUENCIES }, allow_nil: true
  # GeoCoder
  geocoded_by :starting_point
  after_validation :geocode, if: :will_save_change_to_starting_point?
  # Methode pour pour gérer une walk réucrrente ou non cad frequency = nil
  def recurring?
    frequency != nil
  end
end
