class Breed < ApplicationRecord
  has_many :dogs, dependent: :destroy
end
