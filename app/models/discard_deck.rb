class DiscardDeck < Deck
  validate :no_draw

  def no_draw
    errors.add(:draw_pile, "should be empty for the discard pile") unless draws.size == 0
  end
end
