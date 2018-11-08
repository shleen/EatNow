class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_no
      t.string :cvv
      t.string :card_type

      t.timestamps
    end
  end
end
