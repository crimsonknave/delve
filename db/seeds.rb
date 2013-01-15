# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

@errors = []
def check_for_errors(collection)
  collection.each do |c|
    unless c.valid?
      puts c.errors.full_messages
      @errors.push(c.errors.full_messages)
    end
  end
end

cards = Card.create([
            {type: "OneHand", name: "Battleaxe", level: 1, kind: "Item", attack: 2, defense: 0, value: 2},
            {type: "OneHand", name: "Spikey Shield", level: 1, kind: "Item", attack: 1, defense: 1, value: 2},
            {type: "OneHand", name: "Basic Shield", level: 1, kind: "Item", attack: 0, defense: 2, value: 2},
            {type: "Boots", name: "Encumbering Boots", level: 1, kind: "Item", attack: -1, defense: 2, value: 1},
            {type: "Other", name: "Bucker", level: 1, kind: "Item", attack: 0, defense: 1, value: 1},
            {type: "TwoHand", name: "Bastard Sword", level: 1, kind: "Item", attack: 3, defense: 0, value: 3},
            {type: "Armor", name: "Chainmail", level: 1, kind: "Item", attack: 0, defense: 2, value: 2},
            {type: "Armor", name: "Priestly Robes", level: 1, kind: "Item", attack: 0, defense: 1, willpower: 3, value: 2},
            {type: "Armor", name: "Spiky Armor", level: 1, kind: "Item", attack: 1, defense: 1, value: 2},
            {type: "Monster", name: "Ogre", level: 1, kind: "Encounter", attack: 7, defense: 5, intelligence: 2, willpower: 3, dexterity: 1, treasures: 3, aggro: 4, base_movement: 3, movement_range: 3},
            {type: "Monster", name: "Mushroom Grown Around a Treasure Chest", level: 1, kind: "Encounter", attack: 0, defense: 7, intelligence: 0, willpower: 0, dexterity: 0, treasures: 1, aggro: 0, base_movement: 0, movement_range: 0},
            {type: "Monster", name: "Lone Goblin", level: 1, kind: "Encounter", attack: 3, defense: 2, intelligence: 3, willpower: 2, dexterity: 4, treasures: 1, aggro: 2, base_movement: 2, movement_range: 2},
            {type: "Armor", name: "Mithril Mail", level: 2, kind: "Item", attack: 0, defense: 3, dexterity: 3, value: 4},
            {type: "Armor", name: "Minion Mail", level: 2, kind: "Item", attack: 0, defense: 5, intelligence: -1, willpower: -1, dexterity: -1, value: 4},
            {type: "Helm", name: "Magic Helmet", level: 2, kind: "Item", attack: 0, defense: 2, value: 2},
            {type: "Helm", name: "Wizard's Hat", level: 2, kind: "Item", attack: 0, defense: 1, intelligence: 3, value: 2},
            {type: "TwoHand", name: "Reckless Warglaive", level: 2, kind: "Item", attack: 9, defense: -2, value: 6},
            {type: "Other", name: "Dragon Tooth Clasp", level: 2, kind: "Item", attack: 2, defense: 0, value: 2},
            {type: "Boots", name: "Enchanted Boots", level: 2, kind: "Item", attack: 0, defense: 2, value: 2},
            {type: "OneHand", name: "Tower Shield", level: 2, kind: "Item", attack: -2, defense: 6, value: 4},
            {type: "Monster", name: "Clay Golem", level: 2, kind: "Encounter", attack: 10, defense: 14, intelligence: 0, willpower: 0, dexterity: 1, treasures: 3, aggro: 5, base_movement: 3, movement_range: 0},
            {type: "Monster", name: "Velociraptor", level: 2, kind: "Encounter", attack: 11, defense: 9, intelligence: 1, willpower: 3, dexterity: 5, treasures: 2, aggro: 6, base_movement: 6, movement_range: 3},
            {type: "Monster", name: "Enraged Owlbear", level: 2, kind: "Encounter", attack: 7, defense: 5, intelligence: 2, willpower: 4, dexterity: 1, treasures: 1, aggro: 7, base_movement: 3, movement_range: 3},
            {type: "TwoHand", name: "Eternal Claymore", level: 3, kind: "Item", attack: 10, defense: 0, value: 9},
            {type: "OneHand", name: "Aegis", level: 3, kind: "Item", attack: 0, defense: 6, value: 6},
            {type: "Armor", name: "Saintly Robes", level: 3, kind: "Item", attack: 0, defense: 6, willpower: 1, value: 6},
            {type: "Armor", name: "Wizard Robes", level: 3, kind: "Item", attack: 0, defense: 6, intelligence: 1, value: 6},
            {type: "Helm", name: "Fop Hat", level: 3, kind: "Item", defense: 4, intelligence: -1, willpower: -1, dexterity: -1, value: 3},
            {type: "Other", name: "Ceremonial Gold Dagger of Malevolence", level: 3, kind: "Item", attack: 3, defense: 0, value: 3},
            {type: "Other", name: "Guardian Spirit Brooch", level: 3, kind: "Item", attack: 0, defense: 3, value: 3},
            {type: "Monster", name: "Iron Golem", level: 3, kind: "Encounter", attack: 28, defense: 37, intelligence: 0, willpower: 0, dexterity: 1, treasures: 3, aggro: 4, base_movement: 3, movement_range: 0},
            {type: "Monster", name: "Grey Render", level: 3, kind: "Encounter", attack: 19, defense: 18, intelligence: 1, willpower: 1, dexterity: 1, treasures: 1, aggro: 5, base_movement: 3, movement_range: 3},
            {type: "Consumable", name: "potion", level: 1, kind: "Item"},
            {type: "Consumable", name: "other potion", level: 1, kind: "Item"},
            {type: :Trait, name: "super awesome", level: 1, kind: "Trait", willpower: 2}
])

check_for_errors(cards)


#########
# Example game
# ######


game = Game.create({name: "Test Game"})
check_for_errors([game])

chars = Character.create([{name: "Player 1", health: 4, game_id: game.id, order: 0}, {name: "Player 2", health: 4, game_id: game.id, order: 1}])
check_for_errors(chars)

game.current_player = chars.first
game.save
check_for_errors([game])

game.generate!

puts "==========================="
puts "found #{@errors.size} errors"
puts "==========================="
