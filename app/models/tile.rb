class Tile < ActiveRecord::Base
  attr_accessible :east_exit, :encounter, :level, :north_exit, :room, :south_exit, :top, :west_exit
end
