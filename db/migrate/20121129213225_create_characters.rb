class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :attack
      t.integer :defense
      t.integer :health
      t.integer :dexterity
      t.integer :wisdom
      t.integer :intelligence

      t.timestamps
    end
  end
end
