Types::DeckType = GraphQL::ObjectType.define do
  name 'Deck'
  description 'Locations for all cards'

  field :id, !types.ID

  field :board, Types::BoardType
  field :cards, types[Types::CardType]
  field :game, Types::GameType

end
