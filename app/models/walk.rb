class Walk < ApplicationRecord
  DIFFICULTIES = %w[low medium intense]
  FREQUENCIES = ["every day", "every week", "every two weeks", "every three weeks", "every month"]
  belongs_to :user
  has_many :bookings

  validates :difficulty, inclusion: { in: DIFFICULTIES }
  #Changement de :frequency en string (plus en boolean) + possibillité d'avoir nil si on ne veut pas mettre de récurrence
  validates :frequency, inclusion: { in: FREQUENCIES }, allow_nil: true

# Methode pour pour gérer une walk réucrrente ou non cad frequency = nil
  def recurring?
    frequency != nil
  end
end
