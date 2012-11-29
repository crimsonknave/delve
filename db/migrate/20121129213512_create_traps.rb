class CreateTraps < ActiveRecord::Migration
  def change
    create_table :traps do |t|
      t.string :name
      t.integer :level
      t.integer :treasures
      t.text :details

      t.timestamps
    end
  end
end
