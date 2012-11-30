class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :level
      t.text :details
      t.integer :dexterity
      t.integer :intelligence
      t.integer :wisdom

      t.timestamps
    end
  end
end
