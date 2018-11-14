class CreateRobobs < ActiveRecord::Migration[5.2]
  def change
    create_table :robobs do |t|
      t.string :url

      t.timestamps
    end
  end
end
