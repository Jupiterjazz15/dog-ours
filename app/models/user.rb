class User < ApplicationRecord
  has_many :user_tags, dependent: :destroy
  has_many :tags, through: :user_tags
  has_many :bookings, dependent: :destroy
  has_many :walks, dependent: :destroy
  has_many :booked_walks, through: :bookings, class_name: 'Walk'
  has_many :dogs, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
