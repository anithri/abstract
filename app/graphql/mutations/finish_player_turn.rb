Mutations::FinishPlayerTurn = GraphQL::Relay::Mutation.define do
  name 'FinishPlayerTurn'

  return_field :players, types[Types::PlayerType]

  input_field :game_id, !types.ID

  resolve ->(obj, args, ctx) {
    game = Game.find(args[:game_id])

    Action::ShufflePlayers.call(game)
    { players: game.players }
  }
end
