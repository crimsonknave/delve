class Game < ActiveRecord::Base
  attr_accessible :name
  has_many :card_instances
  has_many :cards, :through => :card_instances
end
