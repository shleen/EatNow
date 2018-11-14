class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :menu_item

  def get_total
    qty * self.menu_item.price
  end
end
