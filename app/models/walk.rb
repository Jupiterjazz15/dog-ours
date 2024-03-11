class Walk < ApplicationRecord
  DIFFICULTIES = %w[Low Medium Intense]
  FREQUENCIES = ["Once", "Every day", "Every other day"]

  validates :number_of_participant, numericality: { less_than_or_equal_to: 3 }
  belongs_to :user
  belongs_to :parent, foreign_key: :parent_id, class_name: 'Walk', optional: true
  has_many :bookings, dependent: :destroy
  has_many :participants, through: :bookings, source: :user
  has_many :messages, dependent: :destroy
  has_many :walks, foreign_key: :parent_id, class_name: "Walk", dependent: :destroy
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
