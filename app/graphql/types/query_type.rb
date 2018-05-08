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

  field :projects, types[Types::DeckType] do
    description 'find decks for project slots'
    resolve ->(_obj, args, _ctx) { Deck.projects }
  end

  field :game, Types::GameType do
    description 'Retrieve a list of Game Locations'
    resolve ->(_obj, args, _ctx) { Game.first }
  end

  field :player, Types::PlayerType do
    description 'Find an Player by id'
    argument :player_id, !types.ID
    resolve ->(_obj, args, _ctx) { Player.find(args['player_id']) }
  end

  field :current_player, Types::PlayerType do
    description 'Get the current Player'
    resolve ->(_obj, args, _ctx) { Game.first.current_player }
  end

  field :players, types[Types::PlayerType] do
    description 'Retrieve a list of Players'
    resolve ->(_obj, args, _ctx) { Game.first.players }
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

  field :bag, Types::BagType do
    description 'Find an Bag by id'
    argument :id, !types.ID
    resolve ->(_obj, args, _ctx) { Bag.find(args['id']) }
  end

  field :bag_by_name, Types::BagType do
    description 'Find an Bag by name'
    argument :name, !types.String
    resolve ->(_obj, args, _ctx) { Bag.by_name(args['name']) }
  end

  field :bags, types[Types::BagType] do
    description 'Retrieve a list of Non-Card Bags'
    resolve ->(_obj, args, _ctx) { Bag.board }
  end

  field :card_bags, types[Types::BagType] do
    description 'Retrieve all Card Bags'
    resolve ->(_obj, args, _ctx) { Bag.cards }
  end

  field :bag_counts, Types::BagCountType do
    description 'Retrieve counts for each bag'
    resolve ->(_obj, args, _ctx) { BagCount.all }
  end

  field :card_worker_count, types.Int do
    description "count of workers assigned to projects"
    resolve ->(_obj, args, _ctx) { Bag.card_workers.length }
  end

end
