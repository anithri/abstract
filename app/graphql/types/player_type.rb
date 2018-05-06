Types::PlayerType = GraphQL::ObjectType.define do
  name 'Player'
  description 'Player Info'

  field :id, !types.ID
  field :name, types.String
  field :theme, types.String
  field :score, types.Int
  field :board, Types::BoardType
  field :cards, types[Types::CardType]
  field :workers, types[Types::WorkerType]
end
