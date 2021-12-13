# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user_1 = User.create!(first_name: 'Ben',
            last_name: 'Cheng',
            email: 'bcyc2004@gmail.com',
            password: 'password')

user_2 = User.create!(first_name: 'Meagan',
            last_name: 'Cheng',
            email: 'meagan@gmail.com',
            password: 'password')

Friendship.create!(user_id: User.first.id, friend_id: User.last.id, status: 1)

(1...30).map do |num|
  if num.even?
    Entry.create!(user_id: User.first.id, body: "Entry on date #{Date.today - num}", created_at: Date.today - num)
  elsif num.odd?
    Entry.create!(user_id: User.last.id, body: "Entry on date #{Date.today - num}", created_at: Date.today - num)
  end
end