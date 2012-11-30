class Monster < ActiveRecord::Base
  attr_accessible :details, :dexterity, :intelligence, :level, :name, :wisdom
end
