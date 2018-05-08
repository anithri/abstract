module Action
  module FinishPlayerTurn
    def call(game)
      game.player_ids.rotate
      game.save
    end
  end
end
