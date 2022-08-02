require 'rails_helper'

RSpec.describe 'supermarket show page' do
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

  it "shows store name, and a link to view a unique list of all items (supermarket item index)" do
    visit "/supermarkets/#{sooper.id}"

    expect(page).to have_content("King Sooper")
    expect(page).to have_link("items")
    expect(page).not_to have_content("Holly")

    click_link("items")

    expect(page).to have_content("sauce")
    expect(page).not_to have_content("ladder")
    #unsure how to check for no duplicates.
  end
end
