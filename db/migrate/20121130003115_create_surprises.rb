class CreateSurprises < ActiveRecord::Migration
  def change
    create_table :surprises do |t|
      t.integer :level
      t.string :type

      t.timestamps
    end
  end
end
