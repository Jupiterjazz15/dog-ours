require 'csv'

Breed.destroy_all
p "Breeds deleted"
Tag.destroy_all
p "Tags deleted"
UserTag.destroy_all
p "UserTags deleted"
Walk.destroy_all
p "Walks deleted"
Dog.destroy_all
p "Dogs deleted"
User.destroy_all
p "Users deleted"

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

csv_file_path = Rails.root.join('lib', 'seeds', 'fci-breeds.csv')
CSV.foreach(csv_file_path, headers: true) do |row|
  Breed.create!(content: row['name'])
end
p "Breed #{Breed.count} created"

birth_date1 = Date.new(2020, 8, 15)
birth_date2 = Date.new(2022, 10, 10)
start_time1 = DateTime.new(2024,03,25,12,34)
start_time2 = DateTime.new(2024,03,25,12,34)

Dog.create!(name: "Charlie", description: "The funniest dog in the world", birth_date: birth_date1, constraint: "Doesn't like small dogs", picture: "https://img.20mn.fr/2c2xoZqdQhu84Dmhb8ci9Sk/1444x920_media" , fun_fact: "The best swimmer you have ever seen !!",size: "large", breed_id: Breed.take.id, user_id: User.first.id)

Dog.create!(name: "Molly", description: "Lovely, cute and very friendly", birth_date: birth_date2, constraint: "None", picture: "https://cdn.britannica.com/35/233235-050-8DED07E3/Pug-dog.jpg" , fun_fact: "She loves to wear costume",size: "small", breed_id: Breed.take.id, user_id: User.second.id)

Walk.create!(starting_point: "24 Rue de Varenne, 75007, Paris", duration: "20 min", start_time: start_time1, difficulty: "medium", description: "A walk that I like since we can walk in large streets and we can stop in a park." , frequency: "every week",number_of_participant: "2", user_id: User.second.id, longitude: 48.85394251078765, latitude: 2.324669154969887)

Walk.create!(starting_point: "45 Rue des Alouettes, 75019, Paris", duration: "30 min", start_time: start_time2, difficulty: "medium", description: "A walk in les Buttes-Chaumont" , frequency: "every day", number_of_participant: "1", user_id: User.first.id, longitude: 48.8793583169614 , latitude: 2.385697451774964)
