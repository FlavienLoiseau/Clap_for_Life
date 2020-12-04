# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Faker::Config.locale = :fr



i=1
15.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, admin: true, password: "foobar", username: "user"+i.to_s)
  puts "User added"
  i+=1
end

15.times do
  Activity.create(code: Faker::Code.npi, title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph)
  puts "Activity added !"
end

tag_names =  ["Environnement", "Précarité", "Handicap","Lien intergenerationnel", "Aide a l emploi", "Education" ]
tag_names.each {|name| Tag.create(name: name)}
puts "#{Tag.all.size} tags created"

15.times do
  organisation = Organisation.create(
    user_id: rand(1..15),
    activity_id: rand(1..15),
    name: Faker::Company.name,
    registration_number: Faker::Lorem.words(number: 2).join(""),
    registration_date: Faker::Date.between(from: '2014-09-23', to: '2019-09-25'),
    description: Faker::Lorem.paragraph_by_chars(number: 250, supplemental: false),
    confirmed: true
  )
  organisation.tags << [Tag.all.sample, Tag.all.sample]
puts "15 organisations created !"

  mission = Mission.create(
    organisation_id: organisation.id,
    title: ["Collecte de déchets sur la plage", "Campagne sacs réutilisables", "Aide organisation marche pour le climat", "Distribution alimentaire", "Maraude", "Soupe populaire", "Livraison chocolats de Noël", "Allô comment ça va?"].sample,
    contact_first_name: Faker::Name.first_name,
    contact_last_name: Faker::Name.last_name,
    contact_phone: Faker::PhoneNumber.phone_number,
    description: Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false),
    start_date: Faker::Date.between(from: '2020-12-01', to: '2020-12-10'),
    end_date: Faker::Date.between(from: '2020-12-10', to: '2020-12-20'),
    volunteers_needed: rand(2..10)
  )
  mission.tags << [Tag.all.sample, Tag.all.sample]
end
puts "15 missions created !"

i = Organisation.first.id
Organisation.all.count.times do
  Address.create(number: rand(1..50), street: Faker::Address.street_name, city: ["Paris", "Marseille", "Bordeaux", "Nantes"].sample, zipcode: Faker::Address.zip_code, country: "France", addressable_type: "Organisation", addressable_id: i)
  puts "Organisation Address added"
  i+=1
end

i = User.first.id
User.all.count.times do
  Address.create(number: rand(1..50), street: Faker::Address.street_name, city: ["Paris", "Marseille", "Bordeaux", "Nantes"].sample, zipcode: Faker::Address.zip_code, country: "France", addressable_type: "User", addressable_id: i)
  puts "User Address added"
  i+=1
end

i = Mission.first.id
Mission.all.count.times do
  Address.create(number: rand(1..50), street: Faker::Address.street_name, city: ["Paris", "Marseille", "Bordeaux", "Nantes"].sample, zipcode: Faker::Address.zip_code, country: "France", addressable_type: "Mission", addressable_id: i)
  puts "Mission Address added"
  i+=1
end

10.times do
  Participation.create(user_id: User.all.sample.id, mission_id: Mission.all.sample.id)
  puts "Participation created"
end
