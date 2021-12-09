# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(first_name: 'Ben',
            last_name: 'Cheng',
            email: 'bcyc2004@gmail.com',
            password: 'password')

User.create!(first_name: 'Meagan',
            last_name: 'Cheng',
            email: 'meagan@gmail.com',
            password: 'password')