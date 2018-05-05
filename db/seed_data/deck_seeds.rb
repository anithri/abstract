loc = Board.find_by(name: 'Draw')
game = Game.first
cards = Card.all.to_a.shuffle.map(&:id)

cards.each_with_index do |card, idx|
  Deck.create(
        game: game,
        card_ids: cards,
        board_id: loc.id
  )
end
