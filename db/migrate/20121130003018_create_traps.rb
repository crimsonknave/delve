class CreateTraps < ActiveRecord::Migration
  def change
    create_table :traps do |t|
      t.string :name
      t.integer :level
      t.text :details
      t.string :check_type
      t.integer :check_difficulty

      t.timestamps
    end
  end
end
