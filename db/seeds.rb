# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

cards = Card.create([
            {:type => "OneHand", :name => "sword", :level => 1, :kind => "Item", :attack => 2, :defense => 0},
            {:type => "OneHand", :name => "shield", :level => 1, :kind => "Item", :attack => 0, :defense => 2},
            {:type => "Armor", :name => "armor", :level => 1, :kind => "Item", :defense => 1, :attack => 1},
            {:type => "Helm", :name => "hat", :level => 1, :kind => "Item", :defense => 1},
            {:type => "Boots", :name => "shoes", :level => 1, :kind => "Item", :defense => 1, :dexterity => 1},
            {:type => "Other", :name => "necklace", :level => 1, :kind => "Item"},
            {:type => "Other", :name => "ring", :level => 1, :kind => "Item"},
            {:type => "Consumable", :name => "potion", :level => 1, :kind => "Item"},
            {:type => "Consumable", :name => "other potion", :level => 1, :kind => "Item"},
            {:type => :Trait, :name => "super awesome", :level => 1, :kind => "Trait", :wisdom => 2}
])

#########
# Example game
# ######

errors = []
def check_for_errors(collection)
  collection.each do |c|
    unless c.valid?
      puts c.errors.full_messages
      errors.push(c.errors.full_messages)
    end
  end
end

game = Game.create({:name => "Test Game"})
check_for_errors([game])

chars = Character.create([{:name => "Player 1", :health => 4, :game_id => game.id}, {:name => "Player 2", :health => 4, :game_id => game.id}])
check_for_errors(chars)

decks = Deck.create([{:type => "EncounterDeck", :level => 1, :game_id => game.id},
            {:type => "ItemDeck", :level => 1, :game_id => game.id},
            {:type => "TraitDeck", :level => -1, :game_id => game.id},
            {:type => "DiscardDeck", :level => -1, :game_id => game.id}
])
check_for_errors(decks)



order = 1
card_instances = []
Card.all.each do |c|
  if c.is_a?(Item)
    deck = Deck.find_by_type("ItemDeck")
  elsif c.is_a?(Encounter)
    deck = Deck.find_by_type("EncounterDeck")
  elsif c.is_a?(Trait)
    deck = Deck.find_by_type("TraitDeck")
  else
    puts "Unknown card type #{c.class} for #{c.inspect}"
    next
  end
  ci = CardInstance.create({:card_id => c.id, :draw_id => deck.id, :game_id => game.id, :order => order})
  card_instances.push(ci)
  order += 1
end
check_for_errors(card_instances)

puts "==========================="
puts "found #{errors.size} errors"
puts "==========================="
