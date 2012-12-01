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

game = Game.create({:name => "Test Game"})

Character.create([{:name => "Player 1", :health => 4, :game_id => game.id}, {:name => "Player 2", :health => 4, :game_id => game.id}])

cards.each do |c|
  char = c.kind_of?(Item) ? Character.first : Character.last
  ci = CardInstance.create({:card_id => c.id, :character_id => char.id, :game_id => game.id})
  puts ci.errors.inspect
end
