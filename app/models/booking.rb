class Booking < ApplicationRecord
  belongs_to :walk
  belongs_to :user

  validates :status, inclusion: { in: %W[pending accepted declined] }

  def accepted!
    update!(status: 'accepted')
  end

  def declined!
    update!(status: 'declined')
  end
end
