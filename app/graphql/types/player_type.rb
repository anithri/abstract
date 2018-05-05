Types::PlayerType = GraphQL::ObjectType.define do
  name 'Player'
  description 'Player Info'

  field :id, !types.ID
  field :name, types.String
  field :theme, types.String
  field :current, types.Boolean
  field :order, types.Int
  field :board, Types::BoardType
  field :cards, types[Types::CardType]

end
