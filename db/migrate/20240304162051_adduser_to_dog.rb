class AdduserToDog < ActiveRecord::Migration[7.1]
  def change
    add_reference :dogs, :user, foreign_key: true
  end
end
