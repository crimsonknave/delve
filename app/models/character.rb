class Character < ActiveRecord::Base
  attr_accessible :game_id, :health, :name

  has_many :card_instances, :autosave => true
  has_many :cards, :through => :card_instances

  validate :gear_limits

  belongs_to :game

  def gear_limits
    errors.add(:armor, "may only equip one armor") if cards.armor.equiped.size > 1
    errors.add(:helm, "may only equip one helm") if cards.helm.equiped.size > 1
    errors.add(:boots, "may only equip one pair of boots") if cards.boots.equiped.size > 1
    errors.add(:other, "may only equip three other") if cards.other.equiped.size > 3
    errors.add(:consumable, "may only equip one consumable") if cards.consumable.equiped.size > 3
    errors.add(:hands, "may only equip two hands") if cards.equiped.calculate(:sum, "case when cards.type='OneHand' then 1 when cards.type='TwoHand' then 2 end").to_i > 2
    errors.add(:backpack, "may only contain three items") if cards.carried.count > 3
  end

  def draw!(type, level, number = 1)
    type = "#{type.capitalize}Deck" unless /\w+(Deck)/.match(type)
    game.decks.where(:type => type, :level => level).first.draw!(self, number)
  end

  def equip!(card)
    Card.transaction do 
      ci = card.instance(game.id)

      ci.active = true
      ci.draw_id = nil
      ci.character_id = id
      ci.discard_id = nil
      ci.held = true
      ci.save!
      save!
    end
  end

  def unequip!(card)
    ci = card.instance(game.id)
    raise "can't unequip a card you don't own!" unless ci.character_id == id
    ci.active = false
    ci.held = true
    ci.save!
    save!
  end

  def take!(card)
    ci = card.instance(game.id)
    ci.draw_id = nil
    ci.character_id = id
    ci.discard_id = nil
    ci.held = true
    ci.save!
    save!
  end

  def drop!(card)
    ci = card.instance(game.id)
    raise "can't drop a card you don't own!" unless ci.character_id == id
    raise "can only drop items" unless card.is_a?(Item)

    ci.draw_id = nil
    ci.character_id = nil
    ci.discard_id = game.decks.discard.first.id
    ci.order = game.decks.discard.first.card_instances.calculate(:max, :order) + 1
    ci.held = false
    ci.active = false
    ci.save!
  end

  def attack
    1 + cards.active.stat_card.sum(:attack)
  end

  def defense
    1 + cards.active.stat_card.sum(:defense)
  end

  def dexterity
    3 + cards.active.stat_card.sum(:dexterity)
  end
  def intelligence
    3 + cards.active.stat_card.sum(:intelligenc)
  end
  def wisdom
    3 + cards.active.stat_card.sum(:wisdom)
  end
end
