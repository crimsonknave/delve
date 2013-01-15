class AddCurrentPlayerIdToGame < ActiveRecord::Migration
  def change
    add_column :games, :current_player_id, :integer
  end
end
