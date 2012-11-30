class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.integer :game_id
      t.string :name
      t.integer :health

      t.timestamps
    end
  end
end
