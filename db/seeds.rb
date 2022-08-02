# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

lowes = Supermarket.create!(name: "Lowes", location: "Denver")
sooper = Supermarket.create!(name: "King Sooper", location: "Denver")
depot = Supermarket.create!(name: "Home Depot", location: "Denver")

miguel = Customer.create!(name: "Miguel")
holly = Customer.create!(name: "Holly")
chris = Customer.create!(name: "Chris")
boomer = Customer.create!(name: "Boomer")

sauce = Item.create!(name: "sauce", price: 5)
steak = Item.create!(name: "steak", price: 15)
broom = Item.create!(name: "broom", price: 10)
lightbulb = Item.create!(name: "lightbulb", price: 10)
ball = Item.create!(name: "ball", price: 5)
