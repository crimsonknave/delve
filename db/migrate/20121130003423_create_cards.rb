class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :character_id
      t.integer :discard_id
      t.integer :draw_id
      t.integer :trap_id
      t.integer :monster_id
      t.integer :trait_id
      t.integer :item_id
      t.integer :surpirse_id
      t.string :type
      t.integer :order

      t.timestamps
    end
  end
end
