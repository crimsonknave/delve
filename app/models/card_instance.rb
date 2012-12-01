class CardInstance < ActiveRecord::Base
  attr_accessible :card_id, :character_id, :discard_id, :draw_id, :game_id

  belongs_to :game
  belongs_to :character
  belongs_to :card

  validates :game_id, :presence => true
  validates :card_id, :presence => true, :uniqueness => { :scope => :game_id }
end
