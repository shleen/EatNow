class CreateStalls < ActiveRecord::Migration[5.2]
  def change
    create_table :stalls do |t|
      t.string :name
      t.boolean :halal

      t.timestamps
    end
  end
end
