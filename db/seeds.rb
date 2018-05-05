Game.destroy_all
game = Game.create

names   = %w{Bruce Barbara Dick Selina}.shuffle
themes  = %w{playerOne playerTwo playerThree playerFour}.shuffle
all     = names.zip(themes)
players = all.map do |(name, theme)|
  Player.find_or_create_by(
    name:  name,
    theme: theme,
    game:  game,
  )
end

game.update_attributes player_ids: players.map(&:id).shuffle

draw_id = Board.find_by(name: 'Draw').id

cards = Card.all.to_a.shuffle.map(&:id)

cards.each_with_index do |card, idx|
  Deck.create(
    game:     game,
    card_ids: cards,
    board_id: draw_id
  )
end
