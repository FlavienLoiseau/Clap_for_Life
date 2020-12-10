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
  user = User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email(domain: 'yopmail.com'), admin: false, password: "foobar", username: "User #{i}")
  i+=1
end
puts "#{User.all.size} Users created"

  Activity.create(code: 03000, title: "Droits de l'Homme", description: "Défense des droits de tous les citoyens")
  Activity.create(code: 15000, title: "Education", description: "Promotion de l'égalité des chances")
  Activity.create(code: 17000, title: "Santé", description: "Prévention et protection sanitaire")
  Activity.create(code: 18000, title: "Médico-social", description: "Soutien aux personnes vulnérables")
  Activity.create(code: 19000, title: "Interventions sociales", description: "Lutte contre toute forme de violence")
  Activity.create(code: 20000, title: "Humanitaire et précarité", description: "Charité envers les plus démunis")
  Activity.create(code: 21000, title: "Services aux personnes âgées", description: "Accompagnement des ainés")
  Activity.create(code: 24000, title: "Environnement", description: "Protection de notre éco-système")
puts "Activities created"


tag_names =
    ["Défense des droits des enfants", 1
    "Défense des droits de l'Homme", 2
    "Défense des droits des minorités", 3
    "Aide à l'enseignement", 4
    "Accompagnement périscolaire", 5
    "Accompagnement des malades", 6
    "Prévention et dépistage", 7
    "Recherche médicale", 8
    "Accueil et protection de l'enfance", 9
    "Services pour adolescents et adultes en difficulté", 10
    'Lutte contre la toxicomanie', 11
    "Aide aux victimes de maladies professionnelles", 12
    "Services sociaux pour les familles", 13
    "Lutte contre le surendettement", 14
    "Aide à l'insertion des jeunes", 15
    'Aide aux chômeurs', 16
    "Aide aux réfugiés et aux immigrés", 17
    'Aide aux victimes de catastrophes naturelles', 18
    "Aide aux victimes de violences conjugales", 19
    "Soutien psychologique et moral", 20
    "Réinsertion de détenus et délinquants", 21
    "Aide financière aux personnes démunies", 22
    "Distribution de nourriture et de vêtements", 23
    "Accompagnement à domicile de personnes âgées", 24
    "Activités pour personnes âgées", 25
    "Protection de la biodiversité", 26
    "Défense et amélioration du cadre de vie environnemental", 27
    "Sensibilisation au développement durable"] 28
tag_names.each {|name| Tag.create(name: name)}
puts "#{Tag.all.size} tags created"



  organisation = Organisation.create(
    user_id: User.find(x),
    activity_id: x,
    name: "xxx",
    registration_number: Faker::Company.french_siret_number,
    registration_date: Faker::Date.between(from: '2014-09-23', to: '2019-09-25'),
    description: Faker::Lorem.paragraph_by_chars(number: 250, supplemental: false),
    confirmed: true, 
    tags: []
  )

  Organisation.create(
    user_id: User.find(1),
    activity_id: 1,
    name: "Amnesty International",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1940-09-23'),
    description: "On dit souvent “L’important c’est de participer”. Mais lorsqu'il s’agit de droits humains, l’important c’est aussi de gagner. Nous voulons combattre, ensemble, pour sans cesse remporter des victoires, l’une après l’autre. Car nous en remportons… mais cela ne se sait pas assez. Notre organisation est née d’une première victoire : la libération de prisonniers d’opinion. Cette première victoire fut l’étincelle qui a déclenché un mouvement rassemblant aujourd'hui plus de 7 millions de personnes dans 70 pays. Ce que nous voulons : le respect des droits humains pour tous.",
    confirmed: true, 
    tags: [Tag.find(1), Tag.find(2), Tag.find(3)],
    logo: 
  )

  Organisation.create(
    user_id: User.find(2),
    activity_id: 2,
    name: "SOS Education",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '2001-01-01'
    description: "SOS Éducation est une association militante qui rassemble 50 000 parents d’élèves et professeurs œuvrant en toute indépendance pour que l’école transmette à chaque enfant les savoirs fondamentaux et le goût de l’excellence. Il s’agit de la première association en France à réunir des parents et des professeurs pour améliorer l’école. Fondée en 2001, par trois jeunes parents d’élèves, l’association est libre et indépendante, ni confessionnelle, ni partisane. Elle se bat au quotidien pour que l’école redevienne un lieu où les enfants apprennent les savoirs fondamentaux et développent leur curiosité, où les professeurs sont exigeants et bienveillants et où les parents sont confiants et impliqués.",
    confirmed: true, 
    tags: [Tag.find(4), Tag.find(5)],
    logo:
  )


  Organisation.create(
    user_id: User.find(3),
    activity_id: 3,
    name: "AIDES",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1948-09-25',
    description: "Créée en 1984, AIDES est la première association française de lutte contre le sida. 1500 militants, volontaires et salariés, se mobilisent chaque jour dans plus de 70 villes de France. AIDES adapte ses actions de soutien et de prévention selon l’évolution de l’épidémie. L’association défend dans la proximité le droit des personnes et combat l’exclusion. À partir des besoins des personnes séropositives recensés lors des actions de terrain, AIDES intervient auprès des pouvoirs publics pour faire évoluer la législation et le système de santé lorsqu’ils induisent l’inégalité d’accès aux soins ou aux droits. Servir de laboratoire d’idées, développer des projets pilotes, mener des actions innovantes en matière de réduction des risques de contamination est également au cœur des missions de l’association.",
    confirmed: true, 
    tags: [Tag.find(6), Tag.find(7)],
    logo:
  )


  Organisation.create(
    user_id: User.find(4),
    activity_id: 4,
    name: "France Handicap",
    registration_number: Faker::Company.french_siret_number,
    registration_date: Faker::Date.between(from: '2014-09-23', to: '2019-09-25'),
    description: "APF France handicap est une importante organisation française, reconnue d’utilité publique, de
    défense et de représentation des personnes en situation de handicap et de leurs proches.
    Elle rassemble aujourd’hui 100 000 acteurs : adhérent.e.s, élu.e.s, salarié.e.s, bénévoles et
    volontaires, usager.e.s, sans compter ses dizaines de milliers de donateurs, donatrices et
    sympathisant.e.s.
    APF France handicap porte des valeurs humanistes, militantes et sociales et un projet
    d’intérêt général, celui d’une société inclusive et solidaire.
    L’association agit contre les discriminations et pour l’égalité des droits, la citoyenneté, la
    participation sociale et le libre choix du mode de vie des personnes en situation de handicap et de
    leur famille.",
    confirmed: true, 
    tags: [Tag.find(6), Tag.find(8), Tag.find(12), Tag.find(13)],
    logo:
  )


  Organisation.create(
    user_id: User.find(5),
    activity_id: 5,
    name: "Secours Populaire",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1945-11-15'),
    description: "Né en 1945, le Secours populaire est une association à but non lucratif, reconnue d’utilité publique et déclarée Grande cause nationale. Celle-ci est habilitée à recevoir des dons, des legs et des donations. L’association s'est donnée pour mission d’agir contre la pauvreté et l'exclusion en France et dans le monde et de promouvoir la solidarité et ses valeurs. Elle rassemble des personnes de toutes opinions, conditions et origines qui souhaitent faire vivre la solidarité.",
    confirmed: true, 
    tags: [Tag.find(23), Tag.find(22), Tag.find(20), Tag.find(1), Tag.find(2), Tag.find(3), Tag.find(13), Tag.find(17), Tag.find(4)],
    logo:
  )

  Organisation.create(
    user_id: User.find(6),
    activity_id: 6,
    name: "ISFAD",
    registration_number: Faker::Company.french_siret_number,
    registration_date: Faker::Date.between(from: '2014-09-23', to: '2019-09-25'),
    description: "L'association propose un service d’aide à domicile qui intervient sur l’ensemble du département dans le cadre de l’aide à la personne en général pour les familles, aux parents dans l’éducation et la vie familiale, auprès des personnes âgées et des personnes en situation de handicap  dans la prise en compte de la perte d’autonomie.",
    confirmed: true, 
    tags: [Tag.find(24), Tag.find(4), Tag.find(5), Tag.find(10)],
    logo:
  )

  Organisation.create(
    user_id: User.find(7),
    activity_id: 7,
    name: "AMADPA",
    registration_number: Faker::Company.french_siret_number,
    registration_date: Faker::Date.between(from: '2014-09-23', to: '2019-09-25'),
    description: "L’AMADPA est une association qui a pour vocation de promouvoir toutes activités de nature à favoriser le maintien à domicile des personnes âgées ou handicapées. L’AMADPA est un Service Polyvalent d’Aide et de Soins A Domicile .",
    confirmed: true, 
    tags: [Tag.find(24), Tag.find(4), Tag.find(5), Tag.find(10)],
    logo:
  )

  Organisation.create(
    user_id: User.find(8),
    activity_id: 8,
    name: "Greenpeace",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1971-09-25',
    description: "Depuis sa création il y a une cinquantaine d’années, Greenpeace agit sur terre et en mer selon les principes de non-violence pour protéger l’environnement et promouvoir la paix. Aujourd’hui, nous restons fidèles à cette mission, ainsi qu'à notre totale indépendance financière et idéologique. Changements climatiques, inégalités grandissantes, injustices sociales, migrations et conflits armés… Tous les grands défis de notre époque, auxquels nous devons répondre de toute urgence, sont intimement liés – tout comme les structures de pouvoir qui en sont à l’origine et les mentalités qui s’en accommodent. C’est pourquoi il est nécessaire de les transformer conjointement.",
    confirmed: true, 
    tags: [Tag.find(26), Tag.find(27), Tag.find(28)],
    logo:
  )


  Organisation.create(
    user_id: User.find(9),
    activity_id: 8,
    name: "WWF",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1973-09-05'),
    description: "Le Fonds Mondial pour la Nature (WWF) est l'une des toutes premières organisations indépendantes de protection de l'environnement dans le monde, avec un réseau actif dans plus de 100 pays et fort du soutien de près de 6 millions de membres. Le WWF France, Fondation reconnue d'utilité publique, oeuvre pour une planète vivante depuis Paris, Marseille, les Alpes, la Guyane et la Nouvelle-Calédonie.",
    confirmed: true, 
    tags: [Tag.find(26), Tag.find(27), Tag.find(28)],
    logo:
  )

  Organisation.create(
    user_id: User.find(10),
    activity_id: 8,
    name: "Veni Verdi",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '2010-11-05'),
    description: "Veni Verdi est une association 1901 dont l'objectif est de créer des jardins en milieu urbain pour agir sur notre Environnement, notre Société et Économie.",
    confirmed: true, 
    tags: [Tag.find(26), Tag.find(27), Tag.find(28)],
    logo:
  )

  Organisation.create(
    user_id: User.find(11),
    activity_id: 6,
    name: "Les Restos du Coeur",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1985-11-05'),
    description: "Fondés par Coluche en 1985, les Restos du Cœur est une association dont la mission est d’apporter une assistance bénévole aux personnes démunies, notamment dans le domaine alimentaire par l’accès à des repas gratuits, et par la participation à leur insertion sociale et économique, ainsi qu’à toute action contre la pauvreté sous toutes ses formes.",
    confirmed: true, 
    tags: [Tag.find(13), Tag.find(20), Tag.find(23), Tag.find(21), Tag.find(22)],
    logo:
  )

  Organisation.create(
    user_id: User.find(12),
    activity_id: 6,
    name: "Dans ma Rue",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '2015-11-05'),
    description: "Nous luttons contre l’isolement des personnes sans-abri et développons un lien social basé sur l’écoute et le dialogue depuis quatre ans dans les 10ème, 13ème et 15ème arrondissements de Paris, ainsi qu'à Vincennes. Le but premier de l’association est de favoriser le partage et briser la solitude des sans-abri, et donc de prendre le temps de discuter avec les personnes qu'elle rencontre, s'asseoir pour partager un café, échanger, être une oreille attentive, ou partager un moment de détente. Au fil des maraudes un lien de confiance se crée, et permet aux bénévoles de conseiller et rediriger les personnes suivis vers des associations professionnelles en fonction des besoins.",
    confirmed: true, 
    tags: [ag.find(23), Tag.find(22)],
    logo:
  )


puts "#{Organisation.all.size}  organisations created !"



i=1
15.times do
  mission = Mission.create(
    organisation_id: organisation.id,
    title: ["Collecte de déchets sur la plage", "Campagne sacs réutilisables", "Aide organisation marche pour le climat", "Distribution alimentaire", "Maraude", "Soupe populaire", "Livraison chocolats de Noël", "Allô comment ça va?"].sample,
    contact_first_name: Faker::Name.first_name,
    contact_last_name: Faker::Name.last_name,
    contact_phone: Faker::PhoneNumber.phone_number,
    description: Faker::Lorem.paragraph_by_chars(number: 500, supplemental: false),
    start_date: Faker::Date.between(from: '2020-12-12', to: '2020-12-14'),
    end_date: Faker::Date.between(from: '2020-12-14', to: '2020-12-16'),
    volunteers_needed: rand(2..10)
  )
  mission.tags << [Tag.all.sample, Tag.all.sample]
i+=1
end
puts "#{Mission.all.size}  missions created !"

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

20.times do
  Participation.create(user_id: User.all.sample.id, mission_id: Mission.all.sample.id)
  puts "Participation created"
end
