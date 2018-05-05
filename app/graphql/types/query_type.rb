Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :board, Types::BoardType do
    description 'Retrieve a list of Board Locations'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Board.find(args['id']) }
  end

  field :boards, types[Types::BoardType] do
    description 'Find all Boards'
    resolve ->(_obj, args, _ctx) { Board.all }
  end

  field :card, Types::CardType do
    description 'Retrieve a list of Card'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Card.find(args['id']) }
  end

  field :cards, types[Types::CardType] do
    description 'Find all Cards'
    resolve ->(_obj, args, _ctx) { Card.all }
  end

  field :deck, Types::DeckType do
    description 'Retrieve a list of Deck'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Deck.find(args['id']) }
  end

  field :decks, types[Types::DeckType] do
    description 'Find all Decks'
    resolve ->(_obj, args, _ctx) { Deck.all }
  end

  field :game, Types::GameType do
    description 'Retrieve a list of Game Locations'
    resolve ->(_obj, args, _ctx) { Game.first }
  end

  field :player, Types::PlayerType do
    description 'Find an Player by id'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Player.find(args['id']) }
  end

  field :current_player, Types::PlayerType do
    description 'Get the current Player'
    resolve ->(_obj, args, _ctx) { Game.first.current_player }
  end

  field :players, types[Types::PlayerType] do
    description 'Retrieve a list of Players'
    resolve ->(_obj, args, _ctx) { Player.all }
  end

  field :worker, Types::WorkerType do
    description 'Find an Worker by id'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Worker.find(args['id']) }
  end

  field :workers, types[Types::WorkerType] do
    description 'Retrieve a list of Workers'
    resolve ->(_obj, args, _ctx) { Worker.all }
  end

end
