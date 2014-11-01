# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.css )
# Rails.application.config.assets.precompile += %w( frontend/style.css) #frontend.css 
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.css )
Rails.application.config.assets.precompile += %w( backend/backend.css )
Rails.application.config.assets.precompile += %w( backend/sb-admin.css )
# Rails.application.config.assets.precompile += %w( .svg .eot .woff .ttf)
# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
