class Character < ActiveRecord::Base
  attr_accessible :damage, :game_id, :health, :order, :name, :stamina

  has_many :card_instances, :autosave => true
  has_many :cards, :through => :card_instances
  has_many :tile_instances, :autosave => true
  has_many :tiles, :through => :tile_instances

  has_one :current_player_of, class_name: "Game", foreign_key: :current_player_id

  validate :gear_limits
  validates :order, presence: true, numericality: { only_integer: true }

  belongs_to :game

  before_create :set_defaults

  before_save :check_damage

  class ExhausedError < Exception; end

  def set_defaults
    self.stamina = 6
    self.damage = 0
    self.health = 4
  end

  def check_damage
    return if damage.nil? || health.nil?
    if damage >= defense
      self.health = (health - 1)
      self.damage = 0
    end
  end

  def next_player
    game.characters.where(:order => (order + 1) % game.characters.size)
  end

  def previous_player
    game.characters.where(:order => (order - 1) % game.characters.size)
  end

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

  def fight(monster)
    raise ExhaustedError unless stamina > 0
    mi = monster.instance(game.id)
    self.stamina = stamina - 1
    self.damage = damage + monster.attack
    mi.damage = mi.damage + attack
    mi.save!
    save!
    monster
  end

  def regain_stamina
    regen = (damage >= defense/2) ? 2 : 3
    self.stamina = self.stamina <= (self.stamina - regen) ? self.stamina + regen : 6
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
    1 + cards.equiped.stat_card.sum(:attack)
  end

  def defense
    1 + cards.equiped.stat_card.sum(:defense)
  end

  def dexterity
    3 + cards.equiped.stat_card.sum(:dexterity)
  end
  def intelligence
    3 + cards.equiped.stat_card.sum(:intelligence)
  end
  def willpower
    3 + cards.equiped.stat_card.sum(:willpower)
  end
end
