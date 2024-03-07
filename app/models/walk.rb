class Walk < ApplicationRecord
  DIFFICULTIES = %w[low medium intense]
  FREQUENCIES = ["every day", "every week", "every two weeks", "every three weeks", "every month"]
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :participants, through: :bookings, source: :user

  has_many :messages
  validates :difficulty, inclusion: { in: DIFFICULTIES }
  # Changement de :frequency en string (plus en boolean) + possibillité d'avoir nil si on ne veut pas mettre de récurrence
  validates :frequency, inclusion: { in: FREQUENCIES }, allow_nil: true
  # GeoCoder
  geocoded_by :starting_point
  after_validation :geocode, if: :will_save_change_to_starting_point?
  # Methode pour pour gérer une walk réucrrente ou non cad frequency = nil
  def recurring?
    frequency != nil
  end
end
