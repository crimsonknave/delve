class Deck < ActiveRecord::Base
  attr_accessible :game_id, :level, :type

  belongs_to :game

  has_many :draw_instances, :foreign_key => :draw_id, :class_name => "CardInstance", :order => "card_instances.order asc"
  has_many :discard_instances, :foreign_key => :discard_id, :class_name => "CardInstance", :order => "card_instances.order asc"
  has_many :draws, :through => :draw_instances, :source => :card, :order => "card_instances.order asc"
  has_many :discards, :through => :discard_instances, :source => :card, :order => "card_instances.order asc"

  validates :level, :presence => :true, :inclusion => { :in => [-1,1,2,3] }, :uniqueness => { :scope => [:game_id, :type] }
  validates :type, :presence => :true, :inclusion => { :in => ["EncounterDeck", "ItemDeck", "EventDeck", "TraitDeck"] }

  def draw!(cid = false, number = 1)
    cid = game.current_player.id unless cid
    cards = []
    number.times do
      c = draw_instances.first
      c.draw_id = nil
      c.character_id = cid
      c.save!
      cards << c
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
