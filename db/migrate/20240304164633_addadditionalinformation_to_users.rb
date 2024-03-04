class AddadditionalinformationToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :user_name, :string
    add_column :users, :avatar, :string
    add_column :users, :phone_number, :string
    add_column :users, :badge, :integer
    add_column :users, :description, :string
    add_column :users, :point, :integer
    add_column :users, :linkedin_profile, :string
    add_column :users, :birth_date, :date
  end
end
