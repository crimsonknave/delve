class RenameWisdomToWillpower < ActiveRecord::Migration
  def change
    rename_column :cards, :wisdom, :willpower
  end
end
