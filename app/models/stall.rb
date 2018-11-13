class Stall < ApplicationRecord
  has_many :menu_items
  has_many :staff
end
