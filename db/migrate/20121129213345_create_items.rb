class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :type
      t.integer :attack
      t.integer :defense
      t.text :details

      t.timestamps
    end
  end
end
