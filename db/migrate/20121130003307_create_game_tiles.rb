class CreateGameTiles < ActiveRecord::Migration
  def change
    create_table :game_tiles do |t|
      t.integer :game_id
      t.integer :tile_id
      t.integer :character_id
      t.integer :order
      t.integer :x
      t.integer :y
      t.integer :top

      t.timestamps
    end
  end
end
