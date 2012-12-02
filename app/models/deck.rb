class Deck < ActiveRecord::Base
  attr_accessible :game_id, :level, :type

  belongs_to :game

  has_many :draw_instances, :foreign_key => :draw_id, :class_name => "CardInstance", :order => "card_instances.order asc"
  has_many :discard_instances, :foreign_key => :discard_id, :class_name => "CardInstance", :order => "card_instances.order asc"
  has_many :draws, :through => :draw_instances, :source => :card, :order => "card_instances.order asc"
  has_many :discards, :through => :discard_instances, :source => :card, :order => "card_instances.order asc"

  validates :level, :presence => :true, :inclusion => { :in => [-1,1,2,3] }, :uniqueness => { :scope => [:game_id, :type] }
  validates :type, :presence => :true, :inclusion => { :in => ["EncounterDeck", "ItemDeck", "EventDeck", "TraitDeck", "DiscardDeck"] }

  scope :item, where(:type => "ItemDeck")
  scope :encounter, where(:type => "EncounterDeck")
  scope :event, where(:type => "EventDeck")
  scope :trait, where(:type => "TraitDeck")
  scope :discard, where(:type => "DiscardDeck")
  scope :level_one, where(:level => 1)
  scope :level_two, where(:level => 2)
  scope :level_three, where(:level => 3)

  def draw!(char = false, number = 1)
    char = game.current_player unless char
    cards = []
    number.times do
      c = draw_instances.first
      c.draw_id = nil
      c.character_id = char.id
      c.order = char.card_instances.maximum(:order).to_i + 1
      c.save!
      cards << c.card
    end
    cards
  end

  def shuffle!
    cards = draw_instances.shuffle
    cards.each_with_index do |c,i|
      c.order = i
      c.save!
    end
    true
  end

  def shuffle_with_discard!
    cards = draw_instances + discard_instances
    cards.shuffle
    cards.each_with_index do |c,i|
      c.order = i
      c.draw_id = id
      c.discard_id = nil
      c.save!
    end
    true
  end

end
