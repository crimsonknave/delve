class Card < ActiveRecord::Base
  attr_accessible :character_id, :discard_id, :draw_id, :item_id, :monster_id, :order, :surpirse_id, :trait_id, :trap_id, :type
end
