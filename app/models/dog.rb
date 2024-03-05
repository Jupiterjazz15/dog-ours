class Dog < ApplicationRecord
  belongs_to :breed
  belongs_to :user
  has_one_attached :photo
end
