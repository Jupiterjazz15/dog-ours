class ChangeBooleanToStringForFrequencyToWalks < ActiveRecord::Migration[7.1]
  def change
    change_column :walks, :frequency, :string
  end
end
