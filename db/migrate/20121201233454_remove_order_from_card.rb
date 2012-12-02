class RemoveOrderFromCard < ActiveRecord::Migration
  def up
    remove_column :cards, :order
  end

  def down
    add_column :cards, :order, :integer
  end
end
