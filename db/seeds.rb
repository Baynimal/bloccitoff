require 'faker'

5.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Lorem.characters(8)
  )
end
users = User.all

20.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
end
items = Item.all

puts "#{User.count} users created"
puts "#{Item.count} items created"
puts "Seeds Finished"
