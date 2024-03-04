# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Tag.destroy_all

contents = %w[sport movies literature series gardening cooking]

contents.each do |content|
  Tag.create!(content: content)
end

user1 = User.create!(email: "test@gmail.com", password:"123456")
UserTag.create!(user: user1 , tag: Tag.take)
