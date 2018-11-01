class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.datetime :waiting_time, null: false
      t.timestamps
    end
  end
end
