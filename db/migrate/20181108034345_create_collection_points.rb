class CreateCollectionPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_points do |t|
      t.integer :number
      t.integer :x
      t.integer :y
      
      t.timestamps
    end
  end
end
