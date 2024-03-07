class Breed < ApplicationRecord
  has_many :dogs, dependent: :destroy

  def name
    content
  end
end
