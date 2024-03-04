class User < ApplicationRecord
  has_many :user_tags
  has_many :tags, through: :user_tags
  has_many :bookings
  has_many :walks, through: :bookings
  has_many :dogs
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
