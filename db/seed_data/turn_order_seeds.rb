players = Player.all.to_a.shuffle
game = Game.first

TurnOrder.destroy_all

players.each_with_index do |player, idx|
  TurnOrder.create(
             game: game,
             player: player,
             order: idx + 1,
             current: idx == 0
  )
end
