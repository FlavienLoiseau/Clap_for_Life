# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


10.times do
  organisation = Organisation.create(
    user_id: rand(1..10), activity_id: rand(1..10),
    name: Faker::Restaurant.name,
    registration_number: Faker::Lorem.words(number: 2),
    registration_date: Faker::Date.between(from: '2014-09-23', to: '2019-09-25'),
    description: Faker::Lorem.words(number: 20),
    confirmed: true
  )
  puts "Organisation created !"
  mission = Mission.create(
    organisation_id: organisation.id, title: Faker::Lorem.words(number: 5),
    contact_first_name: Faker::Name.name, contact_last_name: Faker::Name.name,
    contact_phone: Faker::PhoneNumber,
    description: Faker::Lorem.words(number: 20),
    start_date: Faker::Date.between(from: '2020-12-01', to: '2020-12-10'),
    end_date: Faker::Date.between(from: '2020-12-10', to: '2020-12-20'),
    volunteers_needed: rand(2..10)
  )
  puts "Mission created !"
end

10.times do
  Tag.create(name: Faker::Lorem.words(number: 1))
  puts "Tag created"
end

10.times do
  user = User.create!(first_name: Faker::Name.first_name, email: Faker::Internet.email, admin: true, password: "foobar")
  puts "User added"
end

10.times do
  Activity.create(code: Faker::Code.npi, title: Faker::Lorem.words(number: 10), description: Faker::Lorem.words(number: 20))
  puts "Activity added !"
end

10.times do
  Address.create(number: rand(1..50), street: Faker::Address.street_name, city: Faker::Address.city, zipcode: Faker::Address.zip_code, country: "France")
  puts "Address added"
end
