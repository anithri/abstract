Types::GameType = GraphQL::ObjectType.define do
  name 'Game'
  description 'Game Info'

  field :id, !types.ID

  field :round, types.Int
  field :phase, types.Int
  field :players, types[Types::PlayerType]
  field :decks, types[Types::DeckType]
  field :boards, types[Types::BoardType]
  field :current_player, Types::PlayerType

end
