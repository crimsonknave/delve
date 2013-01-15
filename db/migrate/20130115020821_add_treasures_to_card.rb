class AddTreasuresToCard < ActiveRecord::Migration
  def change
    add_column :cards, :treasures, :integer
  end
end
