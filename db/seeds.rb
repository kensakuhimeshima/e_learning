# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(
  name: "kensaku Himeshima",
  email: "n.w.a.rndd@gmail.com",
  password: "password",
  is_admin: true
)

50.times do |n|
  User.create!(
      name: Faker::JapaneseMedia::OnePiece.character,
      email: Faker::Internet.unique.email,
      password: "password"
  )
end

# 50.times do |n|
#   Category.create!(
#       title: Faker::JapaneseMedia::OnePiece.location,
#       description: Faker::JapaneseMedia::OnePiece.akuma_no_mi
#   )
# end

users = User.all
user = users.find_by(id: 1)
following = users[2..10]
followers = users[3..15]
following.each {|followed|user.follow(followed)}
followers.each {|follower|follower.follow(user)}