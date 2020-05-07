# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
City.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableTagGossip.destroy_all
PrivateMessage.destroy_all
Comment.destroy_all
Like.destroy_all

10.times do
  city = City.create!(
    name: Faker::Address.city,
    zip_code: rand(10000..95801)
  )
end

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence(word_count: 10),
    email: Faker::Internet.email,
    age: rand(18..28),
    city: City.all.sample,
    password_digest: Faker::Lorem.characters(number: 10)
  )
end

10.times do
  tag = Tag.create!(
    title: "#" + Faker::Lorem.sentence(word_count: 14)
  )
end

20.times do
  gossip = Gossip.create!(
    title: Faker::Lorem.characters(number: 11),
    content: Faker::Lorem.sentence(word_count: 10),
    user: User.all.sample,
  )
end

30.times do
  join_tag_gossip = JoinTableTagGossip.create!(
    tag: Tag.all.sample,
    gossip: Gossip.all.sample
  )
end

#5.times do
 # private_message = PrivateMessage.create!(
  #  content: Faker::Lorem.sentence(word_count: 10),
   # sender: User.all.sample,
    #recipient: User.all.sample
  #)
#end

40.times do
  comment = Comment.create!(
    content: Faker::Lorem.sentence(word_count: 10),
    gossip: Gossip.all.sample,
    user: User.all.sample
  )
end


# Create comments
20.times do
  Comment.create(
    gossip: Gossip.all.sample,
    user: User.all.sample,
    content: Faker::Hipster.sentence(word_count: 40, supplemental: true)
  )
end

#50.times do
 # like = Like.create!(
  #  user: User.all.sample,
   # gossip: Gossip.all.sample,
    #comment: Comment.all.sample
  #)
#end