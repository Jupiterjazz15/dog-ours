class Booking < ApplicationRecord
  belongs_to :walk
  belongs_to :user

  validates :status, inclusion: { in: %W[pending accepted declined] }

  def accepted!
    update!(booking_status: 'accepted')
  end

  def declined!
    update!(booking_status: 'declined')
  end
end
