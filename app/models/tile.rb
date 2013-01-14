class Tile < ActiveRecord::Base
  attr_accessible :east_exit, :encounter, :level, :name, :north_exit, :room, :south_exit, :start, :teleport, :top, :west_exit

  has_many :tile_instances
  has_many :characters, :through => :tile_instances
  has_many :games, :through => :tile_instances

end
