class AddDetailsToMenuitem < ActiveRecord::Migration[5.2]
  def change
    add_column :menu_items, :halal, :boolean, default: false
    add_column :menu_items, :vegetarian, :boolean, default:false
    add_column :menu_items, :desc, :string, null:true

  end
end
