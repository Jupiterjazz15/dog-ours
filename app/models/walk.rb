class Walk < ApplicationRecord
  validate :check_starting_point_format

  DURATIONS = ["15 min", "30 min", "1 h", "More than 1 h"]
  DIFFICULTIES = ["Low", "Medium", "Intense"]
  FREQUENCIES = ["Once", "Every day", "Every other day"]
  PARTICIPANTS = [1, 2, 3]

  belongs_to :user
  belongs_to :dog
  belongs_to :parent, foreign_key: :parent_id, class_name: 'Walk', optional: true

  has_many :bookings, dependent: :destroy
  has_many :participants, through: :bookings, source: :user
  has_many :messages, dependent: :destroy
  has_many :walks, foreign_key: :parent_id, class_name: "Walk", dependent: :destroy

  validates :number_of_participant, numericality: { less_than_or_equal_to: 3 }
  validates :dog_id, presence: true
  validates :user_id, presence: true
  validates :duration, inclusion: { in: DURATIONS }
  validates :difficulty, inclusion: { in: DIFFICULTIES }
  validates :frequency, inclusion: { in: FREQUENCIES }, allow_nil: true
  validates :number_of_participant, inclusion: { in: PARTICIPANTS }
  validates :name, length: { maximum: 16 }
  validates :starting_point, length: { maximum: 43 }

  geocoded_by :starting_point
  after_validation :geocode, if: :will_save_change_to_starting_point?

  def recurring?
    frequency != nil
  end

  def check_starting_point_format
    unless starting_point.match?(/.*\d{5},\s*Paris,\s*France\z/)
      errors.add(:starting_point, "should MANDATORY end like this example: 'address, 75001, Paris, France'")
    end
  end

end
