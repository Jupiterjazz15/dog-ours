class CreateWalks < ActiveRecord::Migration[7.1]
  def change
    create_table :walks do |t|
      t.string :starting_point
      t.integer :duration
      t.datetime :start_time
      t.string :difficulty
      t.string :description 
      t.boolean :frequency
      t.integer :number_of_participant
      t.references :user, null: false, foreign_key: true
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
