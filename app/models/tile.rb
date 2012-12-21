class Tile < ActiveRecord::Base
  attr_accessible :east_exit, :encounter, :level, :name, :north_exit, :room, :south_exit, :start, :teleport, :top, :west_exit
end
