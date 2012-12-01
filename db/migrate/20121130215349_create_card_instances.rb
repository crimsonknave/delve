class CreateCardInstances < ActiveRecord::Migration
  def change
    create_table :card_instances do |t|
      t.integer :card_id
      t.integer :character_id
      t.integer :draw_id
      t.integer :discard_id
      t.integer :game_id

      t.timestamps
    end
  end
end
