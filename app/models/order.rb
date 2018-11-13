class Order < ApplicationRecord
  include Friendlyable

  belongs_to :user
  belongs_to :payment
  has_many :order_items
  has_one :collection_point
end
