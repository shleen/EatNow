class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :qty
      t.string :remarks

      t.timestamps
    end
  end
end
