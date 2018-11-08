class MenuItem < ApplicationRecord
  belongs_to :stall
  has_many :order_items
  has_many :favourite_items
end
