class AddTypeForMenuItems < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :type, :s
  end
end
