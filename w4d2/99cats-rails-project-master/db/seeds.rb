# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(birth_date: 20151116, color: "Brown", name: "Charles", sex: "M", description: "This is a brown cat")
Cat.create!(birth_date: 20151110, color: "White", name: "Fluffy", sex: "M", description: "This is a fluffy white cat")
Cat.create!(birth_date: 20151108, color: "Orange", name: "Dog", sex: "F", description: "This is a orange dog disguised as a cat")
