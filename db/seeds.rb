# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'm@gmail.com', password: '123456', username: 'Michael')
User.create(email: 'r@gmail.com', password: '123456', username: 'Rob')
puts 'Users created!'

User.find(1).countries.create(name: 'Australia')
User.find(2).countries.create(name: 'Ireland')
puts 'Countries created!'
