class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :hash_id, index: true
      t.float :price
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :orders, :users
  end
end
