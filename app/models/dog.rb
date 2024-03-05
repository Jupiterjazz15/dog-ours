class Dog < ApplicationRecord
  SIZES = %w[small medium large]
  belongs_to :breed
  belongs_to :user

  validates :size, inclusion: { in: SIZES }
end
