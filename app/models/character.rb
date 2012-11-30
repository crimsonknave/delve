class Character < ActiveRecord::Base
  attr_accessible :game_id, :health, :name
end
