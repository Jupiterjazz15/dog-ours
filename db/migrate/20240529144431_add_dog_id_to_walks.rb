class AddDogIdToWalks < ActiveRecord::Migration[7.1]
  def change
    add_reference :walks, :dog, foreign_key: true
  end
end
