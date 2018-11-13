class CreateFavouriteItems < ActiveRecord::Migration[5.2]
  def change
    create_table :favourite_items do |t|

      t.timestamps
    end
  end
end
