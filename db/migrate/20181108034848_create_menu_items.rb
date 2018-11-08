class CreateMenuItems < ActiveRecord::Migration[5.2]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.float :price
      t.integer :waiting_time
      t.boolean :vegetarian
      t.string :desc

      t.timestamps
    end
  end
end
