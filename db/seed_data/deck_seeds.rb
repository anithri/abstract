loc = Board.find_by(name: 'Draw')
game = Game.first
cards = Card.all.to_a.shuffle

cards.each_with_index do |card, idx|
  Deck.create(
        game: game,
        card: card,
        order: idx + 1,
        board_id: loc.id
  )
end
