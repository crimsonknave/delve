class Room < ActiveRecord::Base
  attr_accessible :name, :revealed, :x, :y
end
