class AddNameToWalks < ActiveRecord::Migration[7.1]
  def change
    add_column :walks, :name, :string
  end
end
