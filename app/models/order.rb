class Order < ApplicationRecord
  include Friendlyable

  belongs_to :user
  belongs_to :collection_point
  belongs_to :payment
  has_many :order_items
end
