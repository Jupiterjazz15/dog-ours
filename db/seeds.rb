require 'csv'

Message.destroy_all
p "Messages deleted"
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

user = User.create!(first_name: "Antoine", last_name: "Lebeau", phone_number: "123-456-7890", email: "antoine@test.com", password: "testpassword")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06DG7195EE-41fa3d1f8d29-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

user = User.create!(first_name: "Coralie", last_name: "Haller", phone_number: "234-567-8901", email: "coralie@test.com", password: "testpassword")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06DG28K0CT-fafee26638ca-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

user = User.create!(first_name: "Guillaume", last_name: "Dupuis", phone_number: "345-678-9012", email: "guillaume@test.com", password: "testpassword" )
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06D6P7V0UX-2fe19bee1d04-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

user = User.create!(first_name: "Antoine", last_name: "Clavel", phone_number: "456-789-0123", email: "toto@test.com", password: "testpassword")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06EKJ558NL-g43dd42946ee-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

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

dog = Dog.create!(name: "Charlie", description: "The funniest dog in the world", birth_date: birth_date1, constraint: "Doesn't like small dogs", fun_fact: "The best swimmer you have ever seen !!",size: "Large", breed_id: Breed.take.id, user_id: User.first.id)
file = URI.open("https://img.passeportsante.net/1200x675/2021-05-06/i106625-signes-bonne-sante-chien.webp")
dog.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

dog = Dog.create!(name: "Molly", description: "Lovely, cute and very friendly", birth_date: birth_date2, constraint: "None", fun_fact: "She loves to wear costume",size: "Small", breed_id: Breed.take.id, user_id: User.second.id)
file =  URI.open("https://cdn.britannica.com/35/233235-050-8DED07E3/Pug-dog.jpg")
dog.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

dog = Dog.create!(name: "Sam", description: "The funniest dog in the world", birth_date: birth_date1, constraint: "Doesn't like small dogs", fun_fact: "The best swimmer you have ever seen !!", size: "Large", breed_id: Breed.take.id, user_id: User.third.id)
file = URI.open("https://img.20mn.fr/2c2xoZqdQhu84Dmhb8ci9Sk/1444x920_media")
dog.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

dog = Dog.create!(name: "Jim", description: "The funniest dog in the world", birth_date: birth_date1, constraint: "Doesn't like small dogs", fun_fact: "The best swimmer you have ever seen !!", size: "Large", breed_id: Breed.take.id, user_id: User.third.id)
file = URI.open("https://www.rustica.fr/images/risques-si-je-possede-chien-dont-race-est-interdite-france-19189-l790-h526.jpg.webp")
dog.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

Walk.create!(starting_point: "45 Rue des Alouettes, 75019, Paris", duration: "30 min", start_time: start_time2, difficulty: "Medium", description: "A walk in les Buttes-Chaumont" , frequency: "Every other day", number_of_participant: "1", user_id: User.first.id)

Walk.create!(starting_point: "24 Rue de Varenne, 75007, Paris", duration: "20 min", start_time: start_time1, difficulty: "Medium", description: "A walk that I like since we can walk in large streets and we can stop in a park." , frequency: "Every day",number_of_participant: "2", user_id: User.second.id)

Walk.create!(starting_point: "140 rue oberkampf, 75011, Paris", duration: "40 min", start_time: start_time1, difficulty: "Medium", description: "A walk that I like since we can walk in large streets and we can stop in a park." , frequency: "Every other day",number_of_participant: "4", user_id: User.third.id)

Walk.create!(starting_point: "45 rue Saint Antoine, 75004, Paris", duration: "30 min", start_time: start_time1, difficulty: "Medium", description: "A walk that I like since we can walk in large streets and we can stop in a park." , frequency: "Every other day",number_of_participant: "4", user_id: User.fourth.id)
