class AddDamageToCardInstance < ActiveRecord::Migration
  def change
    add_column :card_instances, :damage, :integer
  end
end
