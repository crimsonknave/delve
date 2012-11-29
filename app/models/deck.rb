class Deck < ActiveRecord::Base
  attr_accessible :level, :name, :type
end
