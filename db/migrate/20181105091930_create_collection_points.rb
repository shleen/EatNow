class CreateCollectionPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_points do |t|
      t.integer :number, null: false
      t.integer :total_collections, default: 0
      t.integer :x
      t.integer :y

      t.timestamps
    end
  end
end
