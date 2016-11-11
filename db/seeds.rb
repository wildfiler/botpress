# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  email: 'admin@example.com',
  password: 'botpressparty!'
)

Game.create!(
  name: 'Counter-Strike: Global Offensive',
  app_id: Steam::APP_ID_CSGO,
  published: true
)

Game.create!(
  name: 'Team Fortress 2',
  app_id: Steam::APP_ID_TF2,
  published: true
)

Game.create!(
  name: 'DOTA 2',
  app_id: Steam::APP_ID_DOTA2,
  published: true
)
