class Character < ActiveRecord::Base
  attr_accessible :attack, :defense, :dexterity, :health, :intelligence, :name, :wisdom
end
