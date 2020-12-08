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
  name: "Bénévole du futur",
  description: "A créé un compte bénévole",
)

Merit::Badge.create!(
  id: 2,
  name: "Biographe",
  description: "A modifié ses informations personnelles",
  custom_fields: {image: "https://www.flaticon.com/svg/static/icons/svg/3855/3855108.svg"}
)

Merit::Badge.create!(
  id: 3,
  name: "Homme d'action",
  description: "S'est inscrit à sa première mission",
  custom_fields: {image: "https://img.icons8.com/android/48/000000/action.png"}
)

Merit::Badge.create!(
  id: 4,
  name: "Association du futur",
  description: "A créé un profil d'association",
)

Merit::Badge.create!(
  id: 5,
  name: "Organisateur",
  description: "A créé sa première mission",
)

Merit::Badge.create!(
  id: 6,
  name: "Super bénévole",
  description: "S'est inscrit à dix missions",
)
