class Deck < ActiveRecord::Base
  attr_accessible :game_id, :level, :type
end
