# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Image.destroy_all
Comment.destroy_all
for i in 0..5
   User.create(username: "user#{i}", email: "user@num#{i}.fr", password: "pass123", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
   Image.create(stream: Faker::Avatar.image, description: Faker::Avatar.image, extension: Faker::Avatar.image.split('?').first.split('.').last, user_id: User.all.sample.id, private?: [true,false].sample )
   for i in 0..50
    Comment.create(content: Faker::ChuckNorris.fact, user_id: User.all.sample.id, image_id: Image.all.sample.id)
   end
end