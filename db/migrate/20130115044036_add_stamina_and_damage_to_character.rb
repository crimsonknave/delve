class AddStaminaAndDamageToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :stamina, :integer
    add_column :characters, :damage, :integer
  end
end
