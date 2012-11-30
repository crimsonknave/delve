class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type
      t.integer :level
      t.string :name
      t.text :details

      t.timestamps
    end
  end
end
