class AddOrderChargesActiveToCardInstance < ActiveRecord::Migration
  def change
    add_column :card_instances, :charges, :integer
    add_column :card_instances, :active, :boolean
    add_column :card_instances, :order, :integer
  end
end
