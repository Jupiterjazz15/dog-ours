class ChangeIntegerToStringForDurationInWalks < ActiveRecord::Migration[7.1]
  def change
    change_column :walks, :duration, :string 
  end
end
