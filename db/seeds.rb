require 'csv'
require 'open-uri'

Message.destroy_all
p "Messages deleted"
Breed.destroy_all
p "Breeds deleted"
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
user = User.create!(first_name: "Antoine", last_name: "Lebeau", phone_number: "123-456-7890", email: "antoine@test.com", password: "azerty", birth_date: "1990-01-01")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06DG7195EE-41fa3d1f8d29-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog1 = Dog.create!(name: "Charlie", description: "The funniest dog in the world", birth_date: Date.new(2020, 8, 15), constraint: "Doesn't like small dogs", fun_fact: "The best swimmer you have ever seen !!",size: "Large", breed: Breed.find_by_content!("COLLIE ROUGH"), user_id: User.first.id)
file = URI.open("https://img.passeportsante.net/1200x675/2021-05-06/i106625-signes-bonne-sante-chien.webp")
dog1.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

p "#{User.first.first_name} has #{Walk.where(user_id: User.first.id).count} walk(s)"

#### USER 2 CORALIE H. ####
user = User.create!(first_name: "Coralie", last_name: "Haller", phone_number: "234-567-8901", email: "coralie@test.com", password: "azerty", birth_date: "1994-08-15")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06DG28K0CT-fafee26638ca-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog2 = Dog.create!(name: "Molly", description: "Lovely, cute and very friendly", birth_date: Date.new(2022, 10, 10), constraint: "None", fun_fact: "She loves to wear costume",size: "Small", breed: Breed.find_by_content!("PUG"), user_id: User.second.id)
file =  URI.open("https://cdn.britannica.com/35/233235-050-8DED07E3/Pug-dog.jpg")
dog2.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

p "#{User.second.first_name} has #{Walk.where(user_id: User.second.id).count} walk(s)"

#### USER 3 GUILLAUME D. ####
user = User.create!(first_name: "Guillaume", last_name: "Dupuis", phone_number: "345-678-9012", email: "guillaume@test.com", password: "azerty", birth_date: "1998-03-14" )
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06D6P7V0UX-2fe19bee1d04-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog3 = Dog.create!(name: "Sam", description: "The funniest dog in the world", birth_date: Date.new(2020, 8, 15), constraint: "No constraint", fun_fact: "Loves cats", size: "Large", breed: Breed.find_by_content!("AUSTRALIAN SHEPHERD"), user_id: User.third.id)
file = URI.open("https://img.20mn.fr/2c2xoZqdQhu84Dmhb8ci9Sk/1444x920_media")
dog3.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

p "#{User.third.first_name} has #{Walk.where(user_id: User.third.id).count} walk(s)"

#### USER 4 ANTOINE C. ####
user = User.create!(first_name: "Antoine", last_name: "Clavel", phone_number: "456-789-0123", email: "toto@test.com", password: "azerty", birth_date: "1980-10-08")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06EKJ558NL-g43dd42946ee-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog4 = Dog.create!(name: "Jimy", description: "The funniest dog in the world", birth_date: Date.new(2018, 10, 10), constraint: "Doesn't like small dogs", fun_fact: "The best swimmer you have ever seen !!", size: "Large", breed: Breed.find_by_content!("AMERICAN STAFFORDSHIRE TERRIER"), user_id: User.fourth.id)
file = URI.open("https://www.rustica.fr/images/risques-si-je-possede-chien-dont-race-est-interdite-france-19189-l790-h526.jpg.webp")
dog4.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

p "#{User.fourth.first_name} has #{Walk.where(user_id: User.fourth.id).count} walk(s)"


#### USER 5 CLOTHILDE S. ####
user = User.create!(first_name: "Clothilde", last_name: "Scache", phone_number: "456-789-0123", email: "clothilde@test.com", password: "azerty", birth_date: "1997-07-29")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06EHGW24V6-4177402b7800-512")
user.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog5 = Dog.create!(name: "Mac", description: "A kind and joyful dog!", birth_date: Date.new(2019, 05, 10), constraint: "He has no constraint", fun_fact: "He helps me to be motivated to run!", size: "Large", breed: Breed.find_by_content!("GERMAN SHORT- HAIRED POINTING DOG"), user_id: User.fifth.id)
file = URI.open("https://www.animaleco.com/wp-content/uploads/2023/03/175023298_m.jpg")
dog5.photo.attach(io: file, filename: "dog.jpg", content_type: "image/jpeg")

Walk.create!(name: "Walk in 75017", starting_point: "175 Avenue de Wagram, 75017, Paris, France", duration: "1 h", start_time: DateTime.new(2024,03,18,13,00), difficulty: "Medium", description: "A long walk to expend energy" , frequency: "Once",number_of_participant: "3", user_id: User.fifth.id, dog_id: dog5.id)

p "#{User.fifth.first_name} has #{Walk.where(user_id: User.fifth.id).count} walk(s)"


#### USER 6 GABRIELLE S. ####
user6 = User.create!(first_name: "Gabrielle ", last_name: "Simha", phone_number: "456-789-0123", email: "gabrielle@test.com", password: "azerty", birth_date: "1991-01-09")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06E791DEU9-b543cb2a1db7-512")
user6.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog6 = Dog.create!(name: "Will", description: "The best dog!", birth_date: Date.new(2017, 05, 10), constraint: "He doesn't like other male dogs", fun_fact: "He loves tree branches", size: "Large", breed: Breed.find_by_content!("KANGAL SHEPHERD DOG"), user_id: user6.id)
file = URI.open("https://lemagduchien.ouest-france.fr/images/dossiers/2018-10/kangal-1-134823.jpg")
dog6.photo.attach(io: file, filename: "dog.jpg", content_type: "image/jpeg")

Walk.create!(name: "Walk in 75020", starting_point: "16 Rue Ramponeau, 75020, Paris, France", duration: "30 min", start_time: DateTime.new(2024,03,20,17,30), difficulty: "Medium", description: "A long walk with special spot to play" , frequency: "Once",number_of_participant: "2", user_id: user6.id, dog_id: dog6.id)

p "#{user6.first_name} has #{Walk.where(user_id: user6.id).count} walk(s)"


#### USER 7 PIERRE U. ####
user7 = User.create!(first_name: "Pierre", last_name: "Urban", phone_number: "456-789-0123", email: "pierre@test.com", password: "azerty", birth_date: "1989-03-21")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06DZJW1W68-82c2aa6b1622-512")
user7.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog7 = Dog.create!(name: "Bretzel", description: "She has so much energy!", birth_date: Date.new(2018, 07, 18), constraint: "None: she is very kind tolerant", fun_fact: "She loves cats!", size: "Medium", breed: Breed.find_by_content!("BEAGLE HARRIER"), user_id: user7.id)
file = URI.open("https://www.kingpet.fr/ph/u/766721643537408/6401019845823116/be3bff0c84db51867cdc5a58996262031.jpg?align=54,43&v=31&fm=webp&w=1080&h=810&q=35")
dog7.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")

Walk.create!(name: "B. Vincennes ", starting_point: "26 Rue du Rendez-Vous, 75012, Paris, France", duration: "1 h", start_time: DateTime.new(2024,03,18,19,0), difficulty: "Medium", description: "A walk around the lac Daumesnil" , frequency: "Once",number_of_participant: "1", user_id: user7.id, dog_id: dog7.id)

p "#{user7.first_name} has #{Walk.where(user_id: user7.id).count} walk(s)"


#### USER 8 ANTONIN D. ####
user8 = User.create!(first_name: "Antonin", last_name: "Danto", phone_number: "456-789-0123", email: "antonin@test.com", password: "azerty", birth_date: "1999-01-05")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06DX3RAEAG-4e517ec9aca6-512")
user8.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog8 = Dog.create!(name: "Pirouette", description: "A very fun buddy!", birth_date: Date.new(2021, 01, 23), constraint: "No constraint", fun_fact: "She loves to swim!", size: "Small", breed: Breed.find_by_content!("MINIATURE PINSCHER"), user_id: user8.id)
file = URI.open("https://www.zooplus.fr/magazine/wp-content/uploads/2023/03/pinscher-nain-sur-une-couverture.jpg")
dog8.photo.attach(io: file, filename: "dog.jpg", content_type: "image/jpeg")

Walk.create!(name: "J. Luxembourg", starting_point: "9 Rue Férou, 75006, Paris, France", duration: "15 min", start_time: DateTime.new(2024,03,22,18,0), difficulty: "Low", description: "A walk in the jardin du Luxembourg", frequency: "Once",number_of_participant: "2", user_id: user8.id, dog_id: dog8.id)

p "#{user8.first_name} has #{Walk.where(user_id: user8.id).count} walk(s)"


#### USER 9 AHMED B. ####
user9 = User.create!(first_name: "Ahmed", last_name: "Boussaada", phone_number: "456-789-0123", email: "ahmed@test.com", password: "azerty", birth_date: "1992-04-04")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06DUHU6VT4-cf7e45775c6c-512")
user9.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog9 = Dog.create!(name: "Kiwi", description: "He is very kind and he loves to meet new dogs!", birth_date: Date.new(2022, 04, 03), constraint: "He is affraid of labradors", fun_fact: "He snores very loudly!", size: "Small", breed: Breed.find_by_content!("CAIRN TERRIER"), user_id: user9.id)
file = URI.open("https://media-be.chewy.com/wp-content/uploads/2021/07/16074327/YorkshireTerrier-FeaturedImage.jpg")
dog9.photo.attach(io: file, filename: "dog.jpg", content_type: "image/jpeg")

Walk.create!(name: "Sqr Pablo-C", starting_point: "59 Rue de Lourmel, 75015, Paris, France", duration: "30 min", start_time: DateTime.new(2024,03,28,20,0), difficulty: "Low", description: "A walk in the Square Pablo-Casals" , frequency: "Once",number_of_participant: "1", user_id: user9.id, dog_id: dog9.id)

p "#{user9.first_name} has #{Walk.where(user_id: user9.id).count} walk(s)"


#### USER 10 PEDRO G. ####
user10 = User.create!(first_name: "Pedro", last_name: "Gomes Pinto", phone_number: "456-789-0123", email: "pedro@test.com", password: "azerty", birth_date: "1985-11-09")
file = URI.open("https://ca.slack-edge.com/T02NE0241-U06D0LP6407-46eab4608195-512")
user10.photo.attach(io: file, filename: "user.jpg", content_type: "image/jpeg")

dog10 = Dog.create!(name: "Pepito", description: "He is so fun and full of energy!", birth_date: Date.new(2020, 12, 19), constraint: "No constraint", fun_fact: "He things that he is much bigger than he is!", size: "Small", breed: Breed.find_by_content!("JACK RUSSELL TERRIER"), user_id: user10.id)
file = URI.open("https://www.chien.fr/assets/img/000/074/og-image/jack-russell-terrier.jpg")
dog10.photo.attach(io: file, filename: "dog.jpg", content_type: "image/jpeg")

Walk.create!(name: "P. G.Brassens", starting_point: "33 Rue de Cronstadt, 75015, Paris, France", duration: "15 min", start_time: DateTime.new(2024,03,23,13,0), difficulty: "Low", description: "A walk in the park Georges Brassens" , frequency: "Once", number_of_participant: "2", user_id: user10.id, dog_id: dog10.id)

p "#{user10.first_name} has #{Walk.where(user_id: user10.id).count} walk(s)"


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

# #file = URI.open("https://www.rustica.fr/images/risques-si-je-possede-chien-dont-race-est-interdite-france-19189-l790-h526.jpg.webp")
# #dog.photo.attach(io: file, filename: "dog.webp", content_type: "image/webp")
