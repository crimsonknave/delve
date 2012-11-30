class GameTile < ActiveRecord::Base
  attr_accessible :character_id, :game_id, :order, :tile_id, :top, :x, :y
end
