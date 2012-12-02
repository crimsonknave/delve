class CardInstance < ActiveRecord::Base
  attr_accessible :active, :card_id, :character_id, :charges, :discard_id, :draw_id, :game_id, :order

  belongs_to :game
  belongs_to :character
  belongs_to :card
  belongs_to :draw_deck, :class_name => "Deck"
  belongs_to :discard_deck, :class_name => "Deck"

  validates :game_id, :presence => true
  validates :card_id, :presence => true, :uniqueness => { :scope => :game_id }
  validates :order, :presence => true, :uniqueness => { :scope => [:game_id, :draw_id, :discard_id] }
  validates :charges, :numericality => { :only_integer => true, :allow_nil => true }

  validate :owned_by_something

  def owned_by_something
    errors.add(:base, "must be owned by something") unless draw_id || discard_id || character_id
  end

  def discard
    self.draw_id = nil
    self.character_id = nil
    self.discard_id = game.decks.where(:type => "#{card.kind}Deck", :level => card.level).first.id
    self.save
  end
end
