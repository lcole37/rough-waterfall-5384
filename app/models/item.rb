class Item < ApplicationRecord
  has_many :customer_items
  has_many :items, through: :customer_item
end
