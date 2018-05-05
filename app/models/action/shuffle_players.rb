module Action
  ShufflePlayers = lambda { |game|
    game.update_attribute(:player_ids, game.player_ids.shuffle)
  }
end

# -*- SkipSchemaAnnotations
