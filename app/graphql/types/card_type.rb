Types::CardType = GraphQL::ObjectType.define do
  name 'Card'
  description 'Card for game'

  field :id, !types.ID
  field :name, types.String
  field :board, Types::BoardType
  field :workers, types[Types::WorkerType]

end
