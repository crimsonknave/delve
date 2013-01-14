class Game < ActiveRecord::Base
  attr_accessible :name
  has_many :card_instances
  has_many :cards, :through => :card_instances
  has_many :tile_instances
  has_many :tiles, :through => :tile_instances

  has_many :decks
  has_many :characters

  def current_player
    puts "Faking this"
    characters.first
  end

  def generate

    decks.create(:level => 1, :type => "EncounterDeck")
    decks.create(:level => 2, :type => "EncounterDeck")
    decks.create(:level => 3, :type => "EncounterDeck")
    decks.create(:level => 1, :type => "ItemDeck")
    decks.create(:level => 2, :type => "ItemDeck")
    decks.create(:level => 3, :type => "ItemDeck")
    decks.create(:level => -1, :type => "TraitDeck")
    decks.create(:level => -1, :type => "DiscardDeck")
    decks.create(:level => -1, :type => "EventDeck")

    Card.encounter.level_one.each_with_index do |card, i|
      CardInstance.create(:game_id => id, :card_id => card.id, :draw_id => decks.encounter.level_one.first.id, :order => i, :order => i)
    end
    Card.encounter.level_two.each_with_index do |card, i|
      CardInstance.create(:game_id => id, :card_id => card.id, :draw_id => decks.encounter.level_two.first.id, :order => i)
    end
    Card.encounter.level_three.each_with_index do |card, i|
      CardInstance.create(:game_id => id, :card_id => card.id, :draw_id => decks.encounter.level_three.first.id, :order => i)
    end
    Card.item.level_one.each_with_index do |card, i|
      c = CardInstance.create(:game_id => id, :card_id => card.id, :draw_id => decks.item.level_one.first.id, :order => i)
    end
    Card.item.level_two.each_with_index do |card, i|
      CardInstance.create(:game_id => id, :card_id => card.id, :draw_id => decks.item.level_two.first.id, :order => i)
    end
    Card.item.level_three.each_with_index do |card, i|
      CardInstance.create(:game_id => id, :card_id => card.id, :draw_id => decks.item.level_three.first.id, :order => i)
    end
    Card.trait.each_with_index do |card, i|
      CardInstance.create(:game_id => id, :card_id => card.id, :draw_id => decks.trait.first.id, :order => i)
    end
    Card.event.each_with_index do |card, i|
      CardInstance.create(:game_id => id, :card_id => card.id, :draw_id => decks.event.first.id, :order => i)
    end

    decks.map {|d| d.shuffle_with_discard!}

  end
end
