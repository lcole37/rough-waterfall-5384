require 'rails_helper'

RSpec.describe 'customer show page' do
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

  it "shows a list of customer items, and supermarket" do
    visit "/customers/#{holly.id}"

    expect(page).to have_content("Holly")
    expect(page).to have_content("sauce")
    expect(page).to have_content("soap")
    expect(page).to have_content("King Sooper")
    expect(page).not_to have_content("ladder")
    expect(page).not_to have_content("Lowes")

    visit "/customers/#{michael.id}"

    expect(page).to have_content("Michael")
    expect(page).to have_content("broom")
    expect(page).to have_content("soap")
    expect(page).to have_content("Lowes")
    expect(page).not_to have_content("steak")
    expect(page).not_to have_content("Home Depot")
  end

  it "shows total price of all items" do
    visit "/customers/#{holly.id}"

    expect(page).to have_content(30)
    expect(page).not_to have_content(75)

    visit "/customers/#{michael.id}"

    expect(page).to have_content(25)
    expect(page).not_to have_content(40)
  end
end
