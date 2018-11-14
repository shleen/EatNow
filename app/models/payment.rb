class Payment < ApplicationRecord
  # belongs_to :card
  has_one :order
end
