class Dog < ApplicationRecord
  SIZES = %w[Small Medium Large]
  belongs_to :breed
  belongs_to :user
  has_one_attached :photo
  validates :size, inclusion: { in: SIZES }
  validates :name, :description, :birth_date, :photo, :size, :breed, presence: true
end
