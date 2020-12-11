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

  Activity.create(code: "03000", title: "Droits de l'Homme", description: "Défense des droits de tous les citoyens")
  Activity.create(code: "15000", title: "Education", description: "Promotion de l'égalité des chances")
  Activity.create(code: "17000", title: "Santé", description: "Prévention et protection sanitaire")
  Activity.create(code: "18000", title: "Médico-social", description: "Soutien aux personnes vulnérables")
  Activity.create(code: "19000", title: "Interventions sociales", description: "Lutte contre toute forme de violence")
  Activity.create(code: "20000", title: "Humanitaire et précarité", description: "Charité envers les plus démunis")
  Activity.create(code: "21000", title: "Services aux personnes âgées", description: "Accompagnement des ainés")
  Activity.create(code: "24000", title: "Environnement", description: "Protection de notre éco-système")
puts "#{Activity.all.size} Activities created"


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
puts "#{Tag.all.size} Tags created"

Organisation.create(
  user_id: 1,
  activity_id: 1,
  name: "Amnesty International",
  registration_number: Faker::Company.french_siret_number,
  registration_date: '1940-09-23',
  description: "On dit souvent L'important c’est de participer. Mais lorsqu il s’agit de droits humains, l’important c’est aussi de gagner. Nous voulons combattre, ensemble, pour sans cesse remporter des victoires, l’une après l’autre. Car nous en remportons… mais cela ne se sait pas assez. Notre organisation est née d’une première victoire : la libération de prisonniers d’opinion. Cette première victoire fut l’étincelle qui a déclenché un mouvement rassemblant aujourd'hui plus de 7 millions de personnes dans 70 pays. Ce que nous voulons : le respect des droits humains pour tous.",
  confirmed: true, 
  tag_ids: [1, 2, 3],
  )
  organisation= Organisation.last
  organisation.logo.attach(io: File.open('./app/assets/images/logo1.jpeg'), filename: 'logo1.jpeg')



  organisation = Organisation.create(
    user_id: 2,
    activity_id: 2,
    name: "SOS Education",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '2001-01-01',
    description: "SOS Éducation est une association militante qui rassemble 50 000 parents d’élèves et professeurs œuvrant en toute indépendance pour que l’école transmette à chaque enfant les savoirs fondamentaux et le goût de l’excellence. Il s’agit de la première association en France à réunir des parents et des professeurs pour améliorer l’école. Fondée en 2001, par trois jeunes parents d’élèves, l’association est libre et indépendante, ni confessionnelle, ni partisane. Elle se bat au quotidien pour que l’école redevienne un lieu où les enfants apprennent les savoirs fondamentaux et développent leur curiosité, où les professeurs sont exigeants et bienveillants et où les parents sont confiants et impliqués.",
    confirmed: true, 
    tag_ids: [4, 5],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo2.jpeg'), filename: 'logo2.jpeg')

 

  organisation = Organisation.create(
    user_id: 3,
    activity_id: 3,
    name: "AIDES",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1948-09-25',
    description: "Créée en 1984, AIDES est la première association française de lutte contre le sida. 1500 militants, volontaires et salariés, se mobilisent chaque jour dans plus de 70 villes de France. AIDES adapte ses actions de soutien et de prévention selon l’évolution de l’épidémie. L’association défend dans la proximité le droit des personnes et combat l’exclusion. À partir des besoins des personnes séropositives recensés lors des actions de terrain, AIDES intervient auprès des pouvoirs publics pour faire évoluer la législation et le système de santé lorsqu’ils induisent l’inégalité d’accès aux soins ou aux droits. Servir de laboratoire d’idées, développer des projets pilotes, mener des actions innovantes en matière de réduction des risques de contamination est également au cœur des missions de l’association.",
    confirmed: true, 
    tag_ids: [6, 7],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo3.jpeg'), filename: 'logo3.jpeg')

  organisation = Organisation.create(
    user_id: 4,
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
    tag_ids: [6, 8, 12, 13],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo4.jpeg'), filename: 'logo4.jpeg')


  organisation = Organisation.create(
    user_id: 5,
    activity_id: 5,
    name: "Secours Populaire",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1945-11-15',
    description: "Né en 1945, le Secours populaire est une association à but non lucratif, reconnue d’utilité publique et déclarée Grande cause nationale. Celle-ci est habilitée à recevoir des dons, des legs et des donations. L’association s'est donnée pour mission d’agir contre la pauvreté et l'exclusion en France et dans le monde et de promouvoir la solidarité et ses valeurs. Elle rassemble des personnes de toutes opinions, conditions et origines qui souhaitent faire vivre la solidarité.",
    confirmed: true, 
    tag_ids: [23, 22, 20, 1, 2, 3, 13, 17, 4],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo5.jpeg'), filename: 'logo5.jpeg')

  organisation = Organisation.create(
    user_id: 6,
    activity_id: 6,
    name: "ISFAD",
    registration_number: Faker::Company.french_siret_number,
    registration_date: Faker::Date.between(from: '2014-09-23', to: '2019-09-25'),
    description: "L'association propose un service d’aide à domicile qui intervient sur l’ensemble du département dans le cadre de l’aide à la personne en général pour les familles, aux parents dans l’éducation et la vie familiale, auprès des personnes âgées et des personnes en situation de handicap  dans la prise en compte de la perte d’autonomie.",
    confirmed: true, 
    tag_ids: [24, 4, 5, 10],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo6.jpeg'), filename: 'logo6.jpeg')

  organisation = Organisation.create(
    user_id: 7,
    activity_id: 7,
    name: "AMADPA",
    registration_number: Faker::Company.french_siret_number,
    registration_date: Faker::Date.between(from: '2014-09-23', to: '2019-09-25'),
    description: "L’AMADPA est une association qui a pour vocation de promouvoir toutes activités de nature à favoriser le maintien à domicile des personnes âgées ou handicapées. L’AMADPA est un Service Polyvalent d’Aide et de Soins A Domicile .",
    confirmed: true, 
    tag_ids: [24, 4, 5, 10],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo7.jpeg'), filename: 'logo7.jpeg')

  organisation = Organisation.create(
    user_id: 8,
    activity_id: 8,
    name: "Greenpeace",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1971-09-25',
    description: "Depuis sa création il y a une cinquantaine d’années, Greenpeace agit sur terre et en mer selon les principes de non-violence pour protéger l’environnement et promouvoir la paix. Aujourd’hui, nous restons fidèles à cette mission, ainsi qu'à notre totale indépendance financière et idéologique. Changements climatiques, inégalités grandissantes, injustices sociales, migrations et conflits armés… Tous les grands défis de notre époque, auxquels nous devons répondre de toute urgence, sont intimement liés – tout comme les structures de pouvoir qui en sont à l’origine et les mentalités qui s’en accommodent. C’est pourquoi il est nécessaire de les transformer conjointement.",
    confirmed: true, 
    tag_ids: [26, 27, 28],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo8.jpeg'), filename: 'logo8.jpeg')


  organisation = Organisation.create(
    user_id: 9,
    activity_id: 8,
    name: "WWF",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1973-09-05',
    description: "Le Fonds Mondial pour la Nature (WWF) est l'une des toutes premières organisations indépendantes de protection de l'environnement dans le monde, avec un réseau actif dans plus de 100 pays et fort du soutien de près de 6 millions de membres. Le WWF France, Fondation reconnue d'utilité publique, oeuvre pour une planète vivante depuis Paris, Marseille, les Alpes, la Guyane et la Nouvelle-Calédonie.",
    confirmed: true, 
    tag_ids: [26, 27, 28],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo9.jpeg'), filename: 'logo9.jpeg')

  organisation = Organisation.create(
    user_id: 10,
    activity_id: 8,
    name: "Veni Verdi",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '2010-11-05',
    description: "Veni Verdi est une association 1901 dont l'objectif est de créer des jardins en milieu urbain pour agir sur notre Environnement, notre Société et Économie.",
    confirmed: true, 
    tag_ids: [26, 27, 28],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo10.jpeg'), filename: 'logo10.jpeg')
  

  organisation = Organisation.create(
    user_id: 11,
    activity_id: 6,
    name: "Les Restos du Coeur",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '1985-11-05',
    description: "Fondés par Coluche en 1985, les Restos du Cœur est une association dont la mission est d’apporter une assistance bénévole aux personnes démunies, notamment dans le domaine alimentaire par l’accès à des repas gratuits, et par la participation à leur insertion sociale et économique, ainsi qu’à toute action contre la pauvreté sous toutes ses formes.",
    confirmed: true, 
    tag_ids: [13, 20, 23, 21, 22],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo11.jpeg'), filename: 'logo11.jpeg')
  

  organisation = Organisation.create(
    user_id: 12,
    activity_id: 6,
    name: "Dans ma Rue",
    registration_number: Faker::Company.french_siret_number,
    registration_date: '2015-11-05',
    description: "Nous luttons contre l’isolement des personnes sans-abri et développons un lien social basé sur l’écoute et le dialogue depuis quatre ans dans les 10ème, 13ème et 15ème arrondissements de Paris, ainsi qu'à Vincennes. Le but premier de l’association est de favoriser le partage et briser la solitude des sans-abri, et donc de prendre le temps de discuter avec les personnes qu'elle rencontre, s'asseoir pour partager un café, échanger, être une oreille attentive, ou partager un moment de détente. Au fil des maraudes un lien de confiance se crée, et permet aux bénévoles de conseiller et rediriger les personnes suivis vers des associations professionnelles en fonction des besoins.",
    confirmed: true, 
    tag_ids: [23, 22],
  )
  organisation.logo.attach(io: File.open('./app/assets/images/logo12.jpeg'), filename: 'logo12.jpeg')


puts "#{Organisation.all.size}  Organisations created !"



mission = Mission.create(
  organisation_id: 1,
  title: "Support à Amnesty International",
  contact_first_name: "Edouard",
  contact_last_name: "Cullen",
  contact_phone: "0658349802",
  description: "A l'occasion du festival de la bienfaisance 2021, Amnesty International cherche 5 personnes motivées pour aider son équipe à organiser son stand dans le but de promouvoir la mission de l'association.",
  start_date: DateTime.parse("20/02/2021 10:00"),
  end_date: DateTime.parse("20/02/2021 13:30"),
  volunteers_needed: 3,
  tag_ids: [1, 2, 3],
)
mission.cover.attach(io: File.open('./app/assets/images/cover1.jpeg'), filename: 'cover1.jpeg')


mission = Mission.create(
  organisation_id: 2,
  title: "Un coup de main pour faire nos devoirs !",
  contact_first_name: "Ron",
  contact_last_name: "Weasley",
  contact_phone: "0845738567",
  description: "Notre association travaille en partenariat avec un centre social qui a pour objectif de de développer la participation, la citoyenneté, la favorisation du lien social et de permettre l'intégration des personnes les plus en difficultés. Les centres sociaux ont pour vocation d'être au cœur des quartiers pour proposer des animations et un lieu de vie, d'échange et de rencontres qui donnent aux habitants la possibilité de participer à la vie du quartier.Avec le soutien d'un animateur, les bénévoles accompagneront des enfants du CP à la cinquième dans l'aide aux devoirs et encadre des temps d'animations. Les enfants accompagnés ont été orientés vers le Centre social par les enseignants en raison d'une certaine difficulté scolaire. ",
  start_date: DateTime.parse("10/01/2021 17:00"),
  end_date: DateTime.parse("20/02/2021 19:30"),
  volunteers_needed: 4,
  tag_ids: [4, 5],
)
mission.cover.attach(io: File.open('./app/assets/images/cover2.jpeg'), filename: 'cover2.jpeg')


mission = Mission.create(
  organisation_id: 3,
  title: "Aide à l'organisation du festival Solidays",
  contact_first_name: "Margaux",
  contact_last_name: "Laval",
  contact_phone: "0734081039",
  description: "Nous recherchons 4 bénévoles très motivés pour aider à l'organisation du festival. Vous serez basé sur le village associations et vous aurez un stand particulier attitré. Vous devrez vous assurer tout au long de la journée que l'association ne manque de rien d'un point de vue logistique et administratif pour bien fonctionner la journée. Lorsque les stands sont pliés, les bénévoles peuvent rejoindre les participants du festival pour les derniers concerts de la nuit.",
  start_date: DateTime.parse("17/06/2021 08:00"),
  end_date: DateTime.parse("24/06/2021 21:00"),
  volunteers_needed: 4,
  tag_ids: [6, 7],
)
mission.cover.attach(io: File.open('./app/assets/images/cover3.jpeg'), filename: 'cover3.jpeg')



mission = Mission.create(
  organisation_id: 4,
  title: "Organisateur course solidaire",
  contact_first_name: "Marie-Amélie",
  contact_last_name: "Grosjean",
  contact_phone: "0739353901",
  description: "Ce dimanche, nous organisons la huitième édition de notre course annuelle pour financer les activités de France Handicap. Nous avons besoin d'une vingtaine de bénévoles pour mettre en place le circuit, mais aussi être autour du parcours pour ravitailler nos valeureux coureurs. Nous organisons un pic-nic pour nos bénévoles à la fin de la course.",
  start_date: DateTime.parse("23/01/2021 08:00"),
  end_date: DateTime.parse("23/01/2021 12:00"),
  volunteers_needed: 17,
  tag_ids: [6, 8, 12, 13],
)
mission.cover.attach(io: File.open('./app/assets/images/cover4.jpeg'), filename: 'cover4.jpeg')



mission = Mission.create(
  organisation_id: 5,
  title: "Distribution de paniers repas",
  contact_first_name: "Pierre",
  contact_last_name: "Leroy",
  contact_phone: "0735802438",
  description: "Nous organisons une distribution de paniers repas à 12h30 samedi sur la place de la mairie. Nous avons besoin de bénévoles pour récupérer les cartons du camion et préparer les paniers repas. Vous aiderez également à distribuer les paniers aux familles dans le besoin.",
  start_date: DateTime.parse("01/02/2021 10:00"),
  end_date: DateTime.parse("01/02/2021 13:30"),
  volunteers_needed: 19,
  tag_ids: [23, 22],
)
mission.cover.attach(io: File.open('./app/assets/images/cover5.jpeg'), filename: 'cover5.jpeg')

mission = Mission.create(
  organisation_id: 6,
  title: "Halte au handicap !",
  contact_first_name: "Pierre",
  contact_last_name: "Petitgros",
  contact_phone: "0635462781",
  description: "Notre association travaille en partenariat avec une école de Sport Handisport qui permet à des personnes en situation de handicap physique ou sensoriel de pratiquer une activité sportive diversifiée et sécurisée. L’école de Sport Handisport propose tous les mercredis hors vacances scolaires de découvrir, de pratiquer la Boccia et la Sarbacane pour des personnes ayant un lourd handicap entrainant souvent un déficit majeur de la motricité. C'est pourquoi, les animateurs ont besoin d'aide pour accompagner toutes les personnes et ainsi réduire les temps d'attente entre les exercices.  Vos missions: Installer le matériel; Accueillir le public en lien avec les animateurs; Former un binôme avec un sportif et l'aider dans sa pratique",
  start_date: DateTime.parse("15/01/2021 17:00"),
  end_date: DateTime.parse("20/01/2021 19:30"),
  volunteers_needed: 5,
  tag_ids: [24, 4, 5, 10],
)
mission.cover.attach(io: File.open('./app/assets/images/cover6.jpeg'), filename: 'cover6.jpeg')


mission = Mission.create(
  organisation_id: 7,
  title: "Allô comment ça va ?",
  contact_first_name: "Valérie",
  contact_last_name: "Delatable",
  contact_phone: "0784958372",
  description: "En France, 1 personne sur 10 souffre d’isolement social. Ce risque d’isolement se trouve aujourd’hui accru par les mesures de confinement liées au COVID-19. C’est dans un objectif de maintien du lien social avec les plus fragiles que le dispositif « Allô comment ça va ? » (ACCV) a ainsi vu le jour. La mission intervient en complémentarité de la plateforme téléphonique « Croix-Rouge chez vous », qui reçoit des appels émis par des personnes isolées. Vos missions de bénévole seront : Prendre de leurs nouvelles; les rassurer et diffuser les bonnes informations sur le COVID-19; leur offrir la possibilité de maintenir un lien social malgré le confinement; les orienter vers les dispositifs sociaux pertinents le cas échéant.",
  start_date: DateTime.parse("01/01/2021 08:00"),
  end_date: DateTime.parse("31/01/2021 19:30"),
  volunteers_needed: 15,
  tag_ids: [24, 4, 5, 10],
)
mission.cover.attach(io: File.open('./app/assets/images/cover7.jpeg'), filename: 'cover7.jpeg')

mission = Mission.create(
  organisation_id: 8,
  title: "Glanage au marché du 12",
  contact_first_name: "Henry",
  contact_last_name: "Four",
  contact_phone: "0784958372",
  description: "Depuis décembre 2015, Greenpeace s'est lancé dans un projet de glanage dans les marchés parisiens. Le but ? Agir à la fois contre la précarité et le gaspillage alimentaire ! Vos missions: récupérer les invendus auprès des commerçants du marché; Récupérer les invendus auprès des commerçants du marché; Distribuer les produits aux personnes qui le demandent",
  start_date: DateTime.parse("01/01/2021 08:00"),
  end_date: DateTime.parse("31/12/2021 08:00"),
  volunteers_needed: 10,
  tag_ids: [26, 27, 28],
)
mission.cover.attach(io: File.open('./app/assets/images/cover8.jpeg'), filename: 'cover8.jpeg')


mission = Mission.create(
  organisation_id: 9,
  title: "Glanage au marché du 20e !",
  contact_first_name: "Amélie",
  contact_last_name: "Poule",
  contact_phone: "0685802438",
  description: "En France, le gaspillage alimentaire représente 260 kg de nourriture par an et par personne ! Pour agir contre ces pertes très importantes, WWF a mis en place une solution simple : récupérer en fin de marché des produits trop abîmés pour être vendus mais parfaitement comestibles et les redistribuer. Le déroulement de l'après-midi est simple : récupération des invendus, tri, et redistribution chaleureuse !",
  start_date: DateTime.parse("29/12/2020 10:00"),
  end_date: DateTime.parse("24/06/2021 13:30"),
  volunteers_needed: 7,
  tag_ids: [26, 27, 28],
)
mission.cover.attach(io: File.open('./app/assets/images/cover9.jpeg'), filename: 'cover9.jpeg')



mission = Mission.create(
  organisation_id: 10,
  title: "Ramassage de déchets à Ivry!",
  contact_first_name: "Rémi",
  contact_last_name: "Detroyes",
  contact_phone: "0685802438",
  description: "L'association organise des opérations de ramassage des déchets en petite et grande couronne parisienne plusieurs week-ends par mois. Il s’agit pour la plupart d’actions sur les berges de fleuves (Seine, Marne, Yerres, etc.) visant à prévenir la pollution des eaux et des océans et à restaurer la nature à son état initial. L’ampleur des dégâts causés par les déchets dans les villes est telle que nous avons toujours besoin de bénévoles... à vous de jouer :)",
  start_date: DateTime.parse("01/01/2021 10:00"),
  end_date: DateTime.parse("02/06/2021 13:30"),
  volunteers_needed: 20,
  tag_ids: [26, 27, 28],
)
mission.cover.attach(io: File.open('./app/assets/images/cover10.jpeg'), filename: 'cover10.jpeg')

mission = Mission.create(
  organisation_id: 11,
  title: "Distribution de colis alimentaires !",
  contact_first_name: "Francesca",
  contact_last_name: "Ravioli",
  contact_phone: "0756837453",
  description: "Trois fois par semaine (le mardi, mercredi et jeudi) les Restos du Coeur organisent des distributions de colis alimentaires à destination de personnes en situation de précarité. Le but étant d'aider les personnes et familles qui n'en n'ont pas les moyens à se nourrir convenablement.  Les demandes sont croissantes et l'activité en est décuplée : préparez-vous pour une session de bénévolat intense ! :)",
  start_date: DateTime.parse("20/02/2021 10:00"),
  end_date: DateTime.parse("20/02/2021 13:30"),
  volunteers_needed: 3,
  tag_ids: [13, 20, 23, 21, 22],
)
mission.cover.attach(io: File.open('./app/assets/images/cover11.jpeg'), filename: 'cover11.jpeg')

mission = Mission.create(
  organisation_id: 11,
  title: "Distribution de colis alimentaires !",
  contact_first_name: "Francesca",
  contact_last_name: "Ravioli",
  contact_phone: "0756837453",
  description: "Trois fois par semaine (le mardi, mercredi et jeudi) les Restos du Coeur organisent des distributions de colis alimentaires à destination de personnes en situation de précarité. Le but étant d'aider les personnes et familles qui n'en n'ont pas les moyens à se nourrir convenablement.  Les demandes sont croissantes et l'activité en est décuplée : préparez-vous pour une session de bénévolat intense ! :)",
  start_date: DateTime.parse("21/02/2021 10:00"),
  end_date: DateTime.parse("21/02/2021 13:30"),
  volunteers_needed: 3,
  tag_ids: [13, 20, 23, 21, 22],
)
mission.cover.attach(io: File.open('./app/assets/images/cover11.jpeg'), filename: 'cover11.jpeg')

mission = Mission.create(
  organisation_id: 11,
  title: "Distribution de colis alimentaires !",
  contact_first_name: "Francesca",
  contact_last_name: "Ravioli",
  contact_phone: "0756837453",
  description: "Trois fois par semaine (le mardi, mercredi et jeudi) les Restos du Coeur organisent des distributions de colis alimentaires à destination de personnes en situation de précarité. Le but étant d'aider les personnes et familles qui n'en n'ont pas les moyens à se nourrir convenablement.  Les demandes sont croissantes et l'activité en est décuplée : préparez-vous pour une session de bénévolat intense ! :)",
  start_date: DateTime.parse("22/02/2021 10:00"),
  end_date: DateTime.parse("22/02/2021 13:30"),
  volunteers_needed: 3,
  tag_ids: [13, 20, 23, 21, 22],
)
mission.cover.attach(io: File.open('./app/assets/images/cover11.jpeg'), filename: 'cover11.jpeg')

mission = Mission.create(
  organisation_id: 12,
  title: "Maraudes",
  contact_first_name: "Jean-Claude",
  contact_last_name: "Martin",
  contact_phone: "0739834204",
  description: "Tous les jeudis soirs, nous organisons avec des bénévoles ponctuels une maraude de quartier dans le 11e arrondissement de Paris. Vous serez toujours accompagné d'un bénévole permanent afin de vous enseigner les bonnes pratiques logistiques aussi vous aider dans vos paroles et gestes auprès des sans-abri. Nous nous retrouvons en général pour deux heures à partir de 19h.",
  start_date: DateTime.parse("23/12/2020 19:00"),
  end_date: DateTime.parse("23/12/2020 21:00"),
  volunteers_needed: 6,
  tag_ids: [23, 22],
)
mission.cover.attach(io: File.open('./app/assets/images/cover12.jpeg'), filename: 'cover12.jpeg')

mission = Mission.create(
  organisation_id: 12,
  title: "Maraudes",
  contact_first_name: "Jean-Claude",
  contact_last_name: "Martin",
  contact_phone: "0739834204",
  description: "Tous les jeudis soirs, nous organisons avec des bénévoles ponctuels une maraude de quartier dans le 11e arrondissement de Paris. Vous serez toujours accompagné d'un bénévole permanent afin de vous enseigner les bonnes pratiques logistiques aussi vous aider dans vos paroles et gestes auprès des sans-abri. Nous nous retrouvons en général pour deux heures à partir de 19h.",
  start_date: DateTime.parse("30/12/2020 19:00"),
  end_date: DateTime.parse("30/12/2020 21:00"),
  volunteers_needed: 6,
  tag_ids: [23, 22],
)
mission.cover.attach(io: File.open('./app/assets/images/cover12.jpeg'), filename: 'cover12.jpeg')


puts "#{Mission.all.size}  Missions created !"




Address.create(number: rand(1..50), street: "Rue Poliveau", city: "Paris", zipcode: "75005", country: "France", addressable_type: "Organisation", addressable_id: 1)
Address.create(number: rand(1..50), street: "Rue Mollien", city: "Boulogne Billancourt", zipcode: "92100", country: "France", addressable_type: "Organisation", addressable_id: 2)
Address.create(number: rand(1..50), street: "Rue de Richelieu", city: "Paris", zipcode: "75001", country: "France", addressable_type: "Organisation", addressable_id: 3)
Address.create(number: rand(1..50), street: "Avenue d'ivry", city: "Paris", zipcode: "75013", country: "France", addressable_type: "Organisation", addressable_id: 4)
Address.create(number: rand(1..50), street: "Rue des petits champs", city: "Paris", zipcode: "75001", country: "France", addressable_type: "Organisation", addressable_id: 5)
Address.create(number: rand(1..50), street: "Rue Pierre Nicole", city: "Paris", zipcode: "75005", country: "France", addressable_type: "Organisation", addressable_id: 6)
Address.create(number: rand(1..50), street: "Rue des Taillandiers", city: "Paris", zipcode: "75011", country: "France", addressable_type: "Organisation", addressable_id: 7)
Address.create(number: rand(1..50), street: "Rue de Varenne", city: "Paris", zipcode: "75007", country: "France", addressable_type: "Organisation", addressable_id: 8)
Address.create(number: rand(1..50), street: "Rue Joseph Abria", city: "Bordeaux", zipcode: "33000", country: "France", addressable_type: "Organisation", addressable_id: 9)
Address.create(number: rand(1..50), street: "Rue de la Croix Blanche", city: "Bordeaux", zipcode: "33074", country: "France", addressable_type: "Organisation", addressable_id: 10)
Address.create(number: rand(1..50), street: "Rue de Malherbe", city: "Rouen", zipcode: "76100", country: "France", addressable_type: "Organisation", addressable_id: 11)
Address.create(number: rand(1..50), street: "Rue des Carmes", city: "Rouen", zipcode: "76000", country: "France", addressable_type: "Organisation", addressable_id: 12)

puts "#{Address.all.size}  Addresses created !"




Address.create(number: rand(1..50), street: "Rue Poliveau", city: "Paris", zipcode: "75005", country: "France", addressable_type: "User", addressable_id: 1)
Address.create(number: rand(1..50), street: "Rue Mollien", city: "Boulogne Billancourt", zipcode: "92100", country: "France", addressable_type: "User", addressable_id: 2)
Address.create(number: rand(1..50), street: "Rue de Richelieu", city: "Paris", zipcode: "75001", country: "France", addressable_type: "User", addressable_id: 3)
Address.create(number: rand(1..50), street: "Avenue d'ivry", city: "Paris", zipcode: "75013", country: "France", addressable_type: "User", addressable_id: 4)
Address.create(number: rand(1..50), street: "Rue des petits champs", city: "Paris", zipcode: "75001", country: "France", addressable_type: "User", addressable_id: 5)
Address.create(number: rand(1..50), street: "Rue Pierre Nicole", city: "Paris", zipcode: "75005", country: "France", addressable_type: "User", addressable_id: 6)
Address.create(number: rand(1..50), street: "Rue des Taillandiers", city: "Paris", zipcode: "75011", country: "France", addressable_type: "User", addressable_id: 7)
Address.create(number: rand(1..50), street: "Rue de Varenne", city: "Paris", zipcode: "75007", country: "France", addressable_type: "User", addressable_id: 8)
Address.create(number: rand(1..50), street: "Rue Joseph Abria", city: "Bordeaux", zipcode: "33000", country: "France", addressable_type: "User", addressable_id: 9)
Address.create(number: rand(1..50), street: "Rue de la Croix Blanche", city: "Bordeaux", zipcode: "33074", country: "France", addressable_type: "User", addressable_id: 10)
Address.create(number: rand(1..50), street: "Rue de Malherbe", city: "Rouen", zipcode: "76100", country: "France", addressable_type: "User", addressable_id: 11)
Address.create(number: rand(1..50), street: "Rue des Carmes", city: "Rouen", zipcode: "76000", country: "France", addressable_type: "User", addressable_id: 12)
Address.create(number: rand(1..50), street: "Rue Madon", city: "Marseille", zipcode: "13005", country: "France", addressable_type: "User", addressable_id: 13)
Address.create(number: rand(1..50), street: "Rue Ferrari", city: "Marseille", zipcode: "13005", country: "France", addressable_type: "User", addressable_id: 14)
Address.create(number: rand(1..50), street: "Rue Breteuil", city: "Marseille", zipcode: "13006", country: "France", addressable_type: "User", addressable_id: 15)

puts "#{Address.all.size}  Addresses created !"

Address.create(number: rand(1..50), street: "Rue Poliveau", city: "Paris", zipcode: "75005", country: "France", addressable_type: "Mission", addressable_id: 1)
Address.create(number: rand(1..50), street: "Rue Mollien", city: "Boulogne Billancourt", zipcode: "92100", country: "France", addressable_type: "Mission", addressable_id: 2)
Address.create(number: rand(1..50), street: "Rue de Richelieu", city: "Paris", zipcode: "75001", country: "France", addressable_type: "Mission", addressable_id: 3)
Address.create(number: rand(1..50), street: "Avenue d'ivry", city: "Paris", zipcode: "75013", country: "France", addressable_type: "Mission", addressable_id: 4)
Address.create(number: rand(1..50), street: "Rue des petits champs", city: "Paris", zipcode: "75001", country: "France", addressable_type: "Mission", addressable_id: 5)
Address.create(number: rand(1..50), street: "Rue Pierre Nicole", city: "Paris", zipcode: "75005", country: "France", addressable_type: "Mission", addressable_id: 6)
Address.create(number: rand(1..50), street: "Rue des Taillandiers", city: "Paris", zipcode: "75011", country: "France", addressable_type: "Mission", addressable_id: 7)
Address.create(number: rand(1..50), street: "Rue de Varenne", city: "Paris", zipcode: "75007", country: "France", addressable_type: "Mission", addressable_id: 8)
Address.create(number: rand(1..50), street: "Rue Joseph Abria", city: "Bordeaux", zipcode: "33000", country: "France", addressable_type: "Mission", addressable_id: 9)
Address.create(number: rand(1..50), street: "Rue de la Croix Blanche", city: "Bordeaux", zipcode: "33074", country: "France", addressable_type: "Mission", addressable_id: 10)
Address.create(number: rand(1..50), street: "Rue de Malherbe", city: "Rouen", zipcode: "76100", country: "France", addressable_type: "Mission", addressable_id: 11)
Address.create(number: rand(1..50), street: "Rue des Carmes", city: "Rouen", zipcode: "76000", country: "France", addressable_type: "Mission", addressable_id: 12)
Address.create(number: rand(1..50), street: "Rue Madon", city: "Marseille", zipcode: "13005", country: "France", addressable_type: "Mission", addressable_id: 13)
Address.create(number: rand(1..50), street: "Rue Ferrari", city: "Marseille", zipcode: "13005", country: "France", addressable_type: "Mission", addressable_id: 14)
Address.create(number: rand(1..50), street: "Rue Breteuil", city: "Marseille", zipcode: "13006", country: "France", addressable_type: "Mission", addressable_id: 15)
Address.create(number: rand(1..50), street: "Boulevard Baille", city: "Marseille", zipcode: "13006", country: "France", addressable_type: "Mission", addressable_id: 16)

puts "#{Address.all.size}  Addresses created !"



20.times do
  Participation.create(user_id: User.all.sample.id, mission_id: Mission.all.sample.id)
end
puts "#{Participation.all.size}  Addresses created !"

