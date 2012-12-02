class Character < ActiveRecord::Base
  attr_accessible :game_id, :health, :name

  has_many :card_instances
  has_many :cards, :through => :card_instances
  has_many :items, :through => :card_instances
  has_many :traits, :through => :card_instances
  has_many :encounters, :through => :card_instances # Aggro tokens
  has_many :events, :through => :card_instances # Aggro tokens

  belongs_to :game

  def draw!(type, level, number = 1)
    type = "#{type.capitalize}Deck" unless /\w+(Deck)/.match(type)
    game.decks.where(:type => type, :level => level).first.draw!(id, number)
  end

  def attack
    1 + cards.stat_card.sum(:attack)
  end

  def defense
    1 + cards.stat_card.sum(:defense)
  end

  def dexterity
    3 + cards.stat_card.sum(:dexterity)
  end
  def intelligence
    3 + cards.stat_card.sum(:intelligenc)
  end
  def wisdom
    3 + cards.stat_card.sum(:wisdom)
  end
end
