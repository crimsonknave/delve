class AddAggroAndBaseMovementAndMovementRangeToCard < ActiveRecord::Migration
  def change
    add_column :cards, :aggro, :integer
    add_column :cards, :base_movement, :integer
    add_column :cards, :movement_range, :integer
  end
end
