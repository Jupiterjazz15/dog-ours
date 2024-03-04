class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :description
      t.date :birth_date
      t.string :constraint
      t.string :picture
      t.string :fun_fact
      t.string :size
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
