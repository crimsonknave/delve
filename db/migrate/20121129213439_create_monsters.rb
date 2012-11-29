class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :attack
      t.integer :defense
      t.text :details
      t.integer :dexterity
      t.integer :wisdom
      t.integer :intelligence

      t.timestamps
    end
  end
end
