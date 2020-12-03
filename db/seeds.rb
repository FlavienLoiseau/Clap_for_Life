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
20.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, admin: true, password: "foobar", username: "user"+i.to_s)
  puts "User added"
  i+=1
end

10.times do
  Activity.create(code: Faker::Code.npi, title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph)
  puts "Activity added !"
end

10.times do
  organisation = Organisation.create(
    user_id: rand(1..10), 
    activity_id: rand(1..10),
    name: Faker::Company.name,
    registration_number: Faker::Lorem.words(number: 2).join(""),
    registration_date: Faker::Date.between(from: '2014-09-23', to: '2019-09-25'),
    description: Faker::Lorem.paragraph_by_chars(number: 250, supplemental: false),
    confirmed: true
  )
  puts "Organisation created !"
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
  puts "Mission created !"
end

i=1
10.times do
  Tag.create(name: ["Environnement", "Précarité", "Handicap" ].sample, tagable_type: "Mission", tagable_id: i )
  puts "Mission Tag created"
  i+=1
end

i=1
10.times do
  Tag.create(name: ["Lien intergenerationnel", "Aide a l emploi", "Education" ].sample, tagable_type: "Mission", tagable_id: i )
  puts "Mission Tag created"
  i+=1
end

i=1
10.times do
  Tag.create(name: ["Environnement", "Précarité", "Handicap"].sample, tagable_type: "Organisation", tagable_id: i )
  puts "Organisation Tag created"
  i+=1
end


i=1
10.times do
  Address.create(number: rand(1..50), street: Faker::Address.street_name, city: ["Paris", "Marseille", "Bordeaux", "Nantes"].sample, zipcode: Faker::Address.zip_code, country: "France", addressable_type: "Organisation", addressable_id: i)
  puts "Organisation Address added"
  i+=1
end

i=1
10.times do
  Address.create(number: rand(1..50), street: Faker::Address.street_name, city: ["Paris", "Marseille", "Bordeaux", "Nantes"].sample, zipcode: Faker::Address.zip_code, country: "France", addressable_type: "User", addressable_id: i)
  puts "User Address added"
  i+=1
end

i=1
10.times do
  Address.create(number: rand(1..50), street: Faker::Address.street_name, city: ["Paris", "Marseille", "Bordeaux", "Nantes"].sample, zipcode: Faker::Address.zip_code, country: "France", addressable_type: "Mission", addressable_id: i)
  puts "Mission Address added"
  i+=1
end


i=1
10.times do
  Participation.create(user_id: rand(1..20), mission_id: rand(1..10))
  puts "Participation created"
end

