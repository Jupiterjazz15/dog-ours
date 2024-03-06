class AddParentIdReferenceToWalks < ActiveRecord::Migration[7.1]
  def change
    add_reference :walks, :parent, foreign_key: { to_table: :walks }, null: true
  end
end
