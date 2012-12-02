class Game < ActiveRecord::Base
  attr_accessible :name
  has_many :card_instances
  has_many :cards, :through => :card_instances
  has_many :decks
  has_many :characters

  def current_player
    puts "Faking this"
    characters.first
  end
end
