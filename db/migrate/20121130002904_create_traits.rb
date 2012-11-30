class CreateTraits < ActiveRecord::Migration
  def change
    create_table :traits do |t|
      t.string :name
      t.text :details
      t.integer :attack
      t.integer :defense
      t.integer :intelligence
      t.integer :wisdom
      t.integer :dexterity

      t.timestamps
    end
  end
end
