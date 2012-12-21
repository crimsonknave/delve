class TileInstance < ActiveRecord::Base
  attr_accessible :character_id, :game_id, :order, :tile_id, :top, :x, :y

  belongs_to :tile
  belongs_to :game
  belongs_to :character

  validates :x, :uniqueness => { :scope => :y, :allow_nil => true }
  validates :y, :uniqueness => { :scope => :x, :allow_nil => true }
  validates :order, :presence => true, :uniqueness => { :scope => :character_id }
end
