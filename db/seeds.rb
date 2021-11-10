# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require './seeds/user'
# require './seeds/posts'

puts 'Start inserting seed "users" ...'
3.times do
  user = User.create(
    email: Faker::Internet.unique.email,
    username: Faker::Internet.unique.user_name,
    password: 'password',
    password_confirmation: 'password'
  )
  puts "\"#{user.username}\" has created!"
end

puts 'Start inserting seed "posts ...'
User.limit(10).each do |user|
  post = user.posts.create({ body: Faker::Hacker.say_something_smart, images: [open("#{Rails.root}/db/fixtures/dummy.png")] })
  puts "post#{post.id} has created!"
end
