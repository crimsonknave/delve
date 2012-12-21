class CreateTileInstances < ActiveRecord::Migration
  def change
    create_table :tile_instances do |t|
      t.integer :game_id
      t.integer :tile_id
      t.integer :character_id
      t.integer :order
      t.integer :x
      t.integer :y
      t.string :top

      t.timestamps
    end
  end
end
