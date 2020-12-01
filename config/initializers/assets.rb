# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )


Rails.application.config.assets.paths << Rails.root.join("lib", "assets", "stylesheets")
Rails.application.config.assets.paths << Rails.root.join("lib", "assets", "javascripts")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "css")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "js")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "docs")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "icons")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "img")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "img", "avatar")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "img", "brand")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "img", "illustration")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "img", "instagram")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "img", "photo")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "bootstrap")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "bootstrap", "css")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "bootstrap", "js")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "boostrap-select")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "bootstrap-select", "css")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "bootstrap-select", "js")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "dropzone")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "dropzone", "min")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "jquery")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "jquery.cookie")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "leaflet")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "leaflet", "images")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "magnifik-popup")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "nouislider")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "object-fit-images")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "prismjs")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "prismjs", "components")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "prismjs", "plugins")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "prismjs", "themes")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "smooth-scroll")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "vendor", "swiper")
