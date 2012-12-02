class AddHeldToCardInstance < ActiveRecord::Migration
  def change
    add_column :card_instances, :held, :boolean
  end
end
