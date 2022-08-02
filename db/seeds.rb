# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
Customer.destroy_all
Supermarket.destroy_all

lowes = Supermarket.create!(name: "Lowes", location: "Denver")
sooper = Supermarket.create!(name: "King Sooper", location: "Denver")
depot = Supermarket.create!(name: "Home Depot", location: "Denver")

holly = sooper.customers.create!(name: "Holly")
michael = lowes.customers.create!(name: "Michael")
chris = sooper.customers.create!(name: "Chris")
boomer = depot.customers.create!(name: "Boomer")

sauce = Item.create!(name: "sauce", price: 5)
steak = Item.create!(name: "steak", price: 15)
broom = Item.create!(name: "broom", price: 10)
soap = Item.create!(name: "soap", price: 10)
lightbulb = Item.create!(name: "lightbulb", price: 5)
ball = Item.create!(name: "ball", price: 5)
ladder = Item.create!(name: "ladder", price: 50)

CustomerItem.create!(customer_id: holly.id, item_id: sauce.id)
CustomerItem.create!(customer_id: holly.id, item_id: steak.id)
CustomerItem.create!(customer_id: holly.id, item_id: soap.id)

CustomerItem.create!(customer_id: michael.id, item_id: broom.id)
CustomerItem.create!(customer_id: michael.id, item_id: lightbulb.id)
CustomerItem.create!(customer_id: michael.id, item_id: soap.id)
