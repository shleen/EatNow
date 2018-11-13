class Order < ApplicationRecord
  include Friendlyable

  belongs_to :user
  has_one :payment
  has_many :order_items
  has_one :collection_point
end
