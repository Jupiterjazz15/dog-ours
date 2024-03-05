class Dog < ApplicationRecord
  SIZES = %w[small medium large]
  belongs_to :breed
  belongs_to :user
  has_one_attached :photo
  validates :size, inclusion: { in: SIZES }
end
