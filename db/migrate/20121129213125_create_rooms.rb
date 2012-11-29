class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :x
      t.integer :y
      t.boolean :revealed

      t.timestamps
    end
  end
end
