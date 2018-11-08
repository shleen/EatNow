class FixWaitingTimeForMenuItems < ActiveRecord::Migration[5.2]
  def change

    remove_column :menu_items, :waiting_time, :datetime
    add_column :menu_items, :waiting_time, :integer
  end
end
