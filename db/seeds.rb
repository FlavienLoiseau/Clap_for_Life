require 'faker'
Faker::Config.locale = :fr

Address.destroy_all
Participation.destroy_all
Tag.destroy_all
Mission.destroy_all
Organisation.destroy_all
Activity.destroy_all
User.destroy_all

i=1
15.times do
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, admin: true, password: "foobar")
  puts "User added"
  i+=1
end


  Activity.create(code: 03000, title: "Droits de l'Homme", description: "Défense des droits de tous les citoyens")
  Activity.create(code: 15000, title: "Education", description: "Promotion de l'égalité des chances")
  Activity.create(code: 17000, title: "Santé", description: "Prévention et protection sanitaire")
  Activity.create(code: 18000, title: "Médico-social", description: "Soutien aux personnes vulnérables")
  Activity.create(code: 19000, title: "Interventions sociales", description: "Lutte contre toute forme de violence")
  Activity.create(code: 20000, title: "Humanitaire et précarité", description: "Charité envers les plus démunis")
  Activity.create(code: 21000, title: "Services aux personnes âgées", description: "Accompagnement des ainés")
  Activity.create(code: 24000, title: "Environnement", description: "Protection de notre éco-système")

tag_names =
    ["Défense des droits des enfants",
    "Défense des droits de l'Homme",
    "Défense des droits des minorités",
    "Aide à l'enseignement",
    "Accompagnement périscolaire",
    "Accompagnement des malades",
    "Prévention et dépistage",
    "Recherche médicale",
    "Accueil et protection de l'enfance",
    "Services pour adolescents et adultes en difficulté",
    'Lutte contre la toxicomanie',
    "Aide aux victimes de maladies professionnelles",
    "Services sociaux pour les familles",
    "Lutte contre le surendettement",
    "Aide à l'insertion des jeunes",
    'Aide aux chômeurs',
    "Aide aux réfugiés et aux immigrés",
    'Aide aux victimes de catastrophes naturelles',
    "Aide aux victimes de violences conjugales",
    "Soutien psychologique et moral",
    "Réinsertion de détenus et délinquants",
    "Aide financière aux personnes démunies",
    "Distribution de nourriture et de vêtements",
    "Accompagnement à domicile de personnes âgées",
    "Activités pour personnes âgées",
    "Protection de la biodiversité",
    "Défense et amélioration du cadre de vie environnemental",
    "Sensibilisation au développement durable"]
tag_names.each {|name| Tag.create(name: name)}
puts "#{Tag.all.size} tags created"


15.times do
  organisation = Organisation.create(
    user_id: User.all.sample.id,
    activity_id: Activity.all.sample.id,
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
