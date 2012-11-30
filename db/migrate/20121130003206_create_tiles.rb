class CreateTiles < ActiveRecord::Migration
  def change
    create_table :tiles do |t|
      t.string :top
      t.boolean :room
      t.boolean :north_exit
      t.boolean :east_exit
      t.boolean :south_exit
      t.boolean :west_exit
      t.boolean :encounter
      t.integer :level

      t.timestamps
    end
  end
end
