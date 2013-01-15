class AddOrderToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :order, :integer
  end
end
