class AddTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string
    add_column :staffs, :type, :string, default: 'Staff'

    add_reference :users, :stall, foreign_key: true, on_delete: :cascade
  end
end
