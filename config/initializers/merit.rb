# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grant badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
Merit::Badge.create!(
  id: 1,
  name: "??????",
  description: "??????????????????????",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/1647/1647169.svg"}
)

Merit::Badge.create!(
  id: 2,
  name: "Biographe",
  description: "A modifié ses informations personnelles",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/3419/3419416.svg"}
)

Merit::Badge.create!(
  id: 3,
  name: "Rêveur",
  description: "S'est inscrit à sa première mission",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/3419/3419466.svg"}
)

Merit::Badge.create!(
  id: 4,
  name: "Association du futur",
  description: "A créé un profil d'association",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/2692/2692721.svg"}
)

Merit::Badge.create!(
  id: 5,
  name: "Organisateur",
  description: "A créé sa première mission",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/1049/1049858.svg"}
)

Merit::Badge.create!(
  id: 6,
  name: "Missionaire",
  description: "S'est inscrit à 10 missions",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/3419/3419247.svg"}
)


Merit::Badge.create!(
  id: 7,
  name: "All Star",
  description: "S'est inscrit à 50 missions",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/3523/3523526.svg"}
)

Merit::Badge.create!(
  id: 8,
  name: "Claper",
  description: "S'est inscrit à 3 missions",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/1049/1049860.svg"}
)

Merit::Badge.create!(
  id: 9,
  name: "Loyal",
  description: "S'est inscrit à 2 missions d'une même association",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/2546/2546440.svg"}
)

Merit::Badge.create!(
  id: 10,
  name: "Protecteur de l'environnement",
  description: "S'est inscrit à une mission Environnement",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/2692/2692740.svg"}
)

Merit::Badge.create!(
  id: 11,
  name: "Defenseur des droits fondamentaux",
  description: "S'est inscrit à une mission Defense des droits ",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/1761/1761066.svg"}
)

Merit::Badge.create!(
  id: 12,
  name: "Transmetteur de savoir",
  description: "S'est inscrit à une mission Education",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/1946/1946628.svg"}
)
