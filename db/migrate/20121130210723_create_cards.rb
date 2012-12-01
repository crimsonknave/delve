class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :type
      t.integer :order
      t.integer :level
      t.text :details
      t.string :name
      t.integer :dexterity
      t.integer :intelligence
      t.integer :wisdom
      t.integer :attack
      t.integer :defense
      t.integer :check_difficulty
      t.string :kind

      t.timestamps
    end
  end
end
