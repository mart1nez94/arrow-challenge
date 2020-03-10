# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |time|
  comment = "This is the #{time} arrow created using a seed"
  user_id = 1
  to_user_id = 2
  Arrow.create!(comment: comment, user_id: user_id, to_user_id: to_user_id)
end
