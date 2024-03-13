require 'csv'

Message.destroy_all
p "Messages deleted"
Breed.destroy_all
p "Breeds deleted"
Message.destroy_all
p "Messages deleted"
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

####  Message de confirmation de la création des breeds ####
csv_file_path = Rails.root.join('lib', 'seeds', 'fci-breeds.csv')
CSV.foreach(csv_file_path, headers: true) do |row|
  Breed.create!(content: row['name'])
end
p "Breed #{Breed.count} created"


##### USER 1 ANTOINE L. ####
user = User.create!(first_name: "Antoine", last_name: "Lebeau", phone_number: "123-456-7890", email: "antoine@test.com", password: "azerty")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06DG7195EE-41fa3d1f8d29-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog = Dog.create!(name: "Charlie", description: "The funniest dog in the world", birth_date: Date.new(2020, 8, 15), constraint: "Doesn't like small dogs", fun_fact: "The best swimmer you have ever seen !!",size: "Large", breed: Breed.find_by_content!("COLLIE ROUGH"), user_id: User.first.id)
file = URI.open("https://img.passeportsante.net/1200x675/2021-05-06/i106625-signes-bonne-sante-chien.webp")
dog.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

Walk.create!(name: "Walk in 75019", starting_point: "41 Av. Mathurin Moreau, 75019 Paris", duration: "15 min", start_time: DateTime.new(2024,03,25,12,30), difficulty: "Medium", description: "A walk in les Buttes-Chaumont" , frequency: "Once", number_of_participant: "1", user_id: User.first.id)

Walk.create!(name: "My favorite walk", starting_point: "41 Av. Mathurin Moreau, 75019 Paris", duration: "30 min", start_time: DateTime.new(2024,03,25,12,30), difficulty: "Medium", description: "A joyful walk in the beautiful parc les Buttes-Chaumont ", frequency: "Every other day", number_of_participant: "1", user_id: User.first.id)

Booking.create!(status: "Accepted", user_id: User.first.id, walk_id: Walk.where(user_id: User.first.id).first&.id)

p "#{User.first.first_name} has #{Walk.where(user_id: User.first.id).count} walk(s) and #{Booking.where(user_id: User.first.id).count} booking(s)"


#### USER 2 CORALIE H. ####
user = User.create!(first_name: "Coralie", last_name: "Haller", phone_number: "234-567-8901", email: "coralie@test.com", password: "azerty")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06DG28K0CT-fafee26638ca-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog = Dog.create!(name: "Molly", description: "Lovely, cute and very friendly", birth_date: Date.new(2022, 10, 10), constraint: "None", fun_fact: "She loves to wear costume",size: "Small", breed: Breed.find_by_content!("PUG"), user_id: User.second.id)
file =  URI.open("https://cdn.britannica.com/35/233235-050-8DED07E3/Pug-dog.jpg")
dog.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

Walk.create!(name: "Walk in 75007", starting_point: "24 Rue de Varenne, 75007, Paris", duration: "30 min", start_time: DateTime.new(2024,03,27,18,00), difficulty: "Medium", description: "A walk that I like since we can walk in large streets and we can stop in a park." , frequency: "Every day",number_of_participant: "2", user_id: User.second.id)

Walk.create!(name: "Walk with Molly", starting_point: "24 Rue de Varenne, 75007, Paris", duration: "15 min", start_time: DateTime.new(2024,03,27,18,00), difficulty: "Low", description: "My favourite walk : charming and very cool!" , frequency: "Once",number_of_participant: "2", user_id: User.second.id)

Booking.create!(status: "Accepted", user_id: User.second.id, walk_id: Walk.where(user_id: User.second.id).first&.id)

p "#{User.second.first_name} has #{Walk.where(user_id: User.second.id).count} walk(s) and #{Booking.where(user_id: User.second.id).count} booking(s)"


#### USER 3 GUILLAUME D. ####
user = User.create!(first_name: "Guillaume", last_name: "Dupuis", phone_number: "345-678-9012", email: "guillaume@test.com", password: "azerty" )
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06D6P7V0UX-2fe19bee1d04-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog = Dog.create!(name: "Sam", description: "The funniest dog in the world", birth_date: Date.new(2020, 8, 15), constraint: "No constraint", fun_fact: "Loves cats", size: "Large", breed: Breed.find_by_content!("AUSTRALIAN SHEPHERD"), user_id: User.third.id)
file = URI.open("https://img.20mn.fr/2c2xoZqdQhu84Dmhb8ci9Sk/1444x920_media")
dog.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

Walk.create!(name: "Walk in 75011", starting_point: "140 rue oberkampf, 75011, Paris", duration: "30 min", start_time: DateTime.new(2024,04,01,12,00), difficulty: "Medium", description: "My favourite walk!", frequency: "Every other day",number_of_participant: "2", user_id: User.third.id)

p "#{User.third.first_name} has #{Walk.where(user_id: User.third.id).count} walk(s) and #{Booking.where(user_id: User.third.id).count} booking(s)"


#### USER 4 ANTOINE C. ####
user = User.create!(first_name: "Antoine", last_name: "Clavel", phone_number: "456-789-0123", email: "toto@test.com", password: "azerty")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06EKJ558NL-g43dd42946ee-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog = Dog.create!(name: "Jim", description: "The funniest dog in the world", birth_date: Date.new(2022, 10, 10), constraint: "Doesn't like small dogs", fun_fact: "The best swimmer you have ever seen !!", size: "Large", breed_id: Breed.find_by_content!("AMERICAN STAFFORDSHIRE TERRIER"), user_id: User.fourth.id)

Walk.create!(name: "Walk in 75004", starting_point: "45 rue Saint Antoine, 75004, Paris", duration: "30 min", start_time: DateTime.new(2024,03,28,13,00), difficulty: "Medium", description: "A peaceful walk." , frequency: "Every other day",number_of_participant: "2", user_id: User.fourth.id)

p "#{User.fourth.first_name} has #{Walk.where(user_id: User.fourth.id).count} walk(s) and #{Booking.where(user_id: User.fourth.id).count} booking(s)"

#### USER 4 CLOTHILDE S. ####
user = User.create!(first_name: "Clothilde", last_name: "Scache", phone_number: "456-789-0123", email: "clothilde@test.com", password: "azerty")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06EHGW24V6-4177402b7800-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog = Dog.create!(name: "Mac", description: "A kind and joyful dog!", birth_date: Date.new(2029, 05, 10), constraint: "He has no constraint", fun_fact: "He helps me to be motivated to run!", size: "Large", breed_id: Breed.find_by_content!("GERMAN SHORT- HAIRED POINTING DOG"), user_id: User.fifth.id)

Walk.create!(name: "Walk in 75017", starting_point: "175 Avenue de Wagram,75017, Paris", duration: "1 h", start_time: DateTime.new(2024,03,18,13,00), difficulty: "Medium", description: "A long walk to expend energy" , frequency: "Once",number_of_participant: "3", user_id: User.fourth.id)

####  Message de confirmation de la création des users ####
p "You have created #{User.count} users"

####  Message de confirmation de la création des tags ####
contents = %w[sport movies literature series gardening cooking]

contents.each do |content|
  Tag.create!(content: content)
end
p "You have created #{Tag.count} tags"

####  Message de confirmation de la création des usertags ####
UserTag.create!(user: User.first, tag: Tag.take)
UserTag.create!(user: User.first, tag: Tag.take)

file = URI.open("https://www.rustica.fr/images/risques-si-je-possede-chien-dont-race-est-interdite-france-19189-l790-h526.jpg.webp")
dog.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")
