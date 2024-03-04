# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Tag.destroy_all

p "Users deleted"
p "Tags deleted"

users_data = [
  { first_name: "Antoine", last_name: "Lebeau", phone_number: "123-456-7890", avatar: "https://ca.slack-edge.com/T02NE0241-U06DG7195EE-41fa3d1f8d29-512", email: "antoine@test.com", password: "testpassword" },
  { first_name: "Coralie", last_name: "Haller", phone_number: "234-567-8901", avatar: "https://ca.slack-edge.com/T02NE0241-U06DG28K0CT-fafee26638ca-512", email: "coralie@test.com", password: "testpassword" },
  { first_name: "Guillaume", last_name: "Dupuis", phone_number: "345-678-9012", avatar: "https://ca.slack-edge.com/T02NE0241-U06D6P7V0UX-2fe19bee1d04-512", email: "guillaume@test.com", password: "testpassword" },
  { first_name: "Antoine", last_name: "Clavel", phone_number: "456-789-0123", avatar: "https://ca.slack-edge.com/T02NE0241-U06EKJ558NL-g43dd42946ee-512", email: "toto@test.com", password: "testpassword" }
]

users_data.each do |user_data|
  User.create!(user_data)
end

p "You have created #{User.count} users"

contents = %w[sport movies literature series gardening cooking]

contents.each do |content|
  Tag.create!(content: content)
end

p "You have created #{Tag.count} tags"

UserTag.create!(user: User.first, tag: Tag.take)
UserTag.create!(user: User.first, tag: Tag.take)
