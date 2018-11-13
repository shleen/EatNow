class Order < ApplicationRecord
  include Friendlyable

  belongs_to :user
  has_one :payment
  has_many :order_items
  has_one :collection_point
 
  def get_total
    total = 0
    self.order_items.each do |oi|
      total += oi.qty * oi.menu_item.price
    end

    total
  end
end
