class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :user, foreign_key: true, on_delete: :cascade
    add_reference :order_items, :order, foreign_key: true, on_delete: :cascade
    add_reference :order_items, :menu_item, foreign_key: true, on_delete: :cascade
    add_reference :menu_items, :stall, foreign_key: true, on_delete: :cascade
    add_reference :orders, :collection_point, foreign_key: true, on_delete: :cascade
    add_reference :orders, :payment, foreign_key: true, on_delete: :cascade
    add_reference :payments, :card, foreign_key: true, on_delete: :cascade
    add_reference :cards, :user, foreign_key: true, on_delete: :cascade
    add_reference :ratings, :menu_item, foreign_key: true, on_delete: :cascade
    add_reference :favourite_items, :menu_item, foreign_key: true, on_delete: :cascade
    add_reference :ratings, :user, foreign_key: true, on_delete: :cascade
    add_reference :favourite_items, :user, foreign_key: true, on_delete: :cascade
  end
end
