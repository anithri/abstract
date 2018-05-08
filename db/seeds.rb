Game.destroy_all
game = Game.create

names   = %w{Bruce Barbara Dick Selina}.shuffle
themes  = %w{playerOne playerTwo playerThree playerFour}
all     = names.zip(themes)
workers = Worker.all.map(&:id).shuffle.combination(3).to_a
players = all.each_with_index.map do |(name, theme), idx|
  Player.find_or_create_by(
    name:       name,
    theme:      theme,
    game:       game,
    worker_ids: workers[idx]
  )
end

game.update_attributes player_ids: players.map(&:id).rotate(rand(4))

draw_id = Board.find_by(name: 'Draw').id
discard_id = Board.find_by(name: 'Discard').id

cards = Card.all.to_a.shuffle.map(&:id)

boards = Board.projects

boards.each_with_index do |board, idx|
  Deck.create(
    game:     game,
    card_ids: [cards[idx]],
    board_id: board.id
  )
end

Board.players.each{|board| Deck.create(game: game, board_id: board.id)}

Deck.create(
  game:     game,
  card_ids: cards.last(cards.length - boards.length),
  board_id: draw_id
)
Deck.create(
  game:     game,
  board_id: discard_id
)

Bucket.all.each do |bucket|
  Bag.create(
    game:       game,
    bucket_id:  bucket.id,
    worker_ids: bucket.default_bag
  )
end
