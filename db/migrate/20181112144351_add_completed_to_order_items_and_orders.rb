class AddCompletedToOrderItemsAndOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :completed, :boolean, default: false
    add_column :orders, :completed, :boolean, default: false
  end
end
