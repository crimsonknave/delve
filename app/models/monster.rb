class Monster < ActiveRecord::Base
  attr_accessible :attack, :defense, :details, :dexterity, :intelligence, :name, :wisdom
end
