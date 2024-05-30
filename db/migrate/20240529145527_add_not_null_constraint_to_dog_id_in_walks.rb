class AddNotNullConstraintToDogIdInWalks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :walks, :dog_id, false
  end
end
