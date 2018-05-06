Types::BagType = GraphQL::ObjectType.define do
  name "Bag"
  description "collections of workers in a bucket on the board"

  field :id, types.ID
  field :game, Types::GameType
  field :name, types.String
  field :count, types.Int
  field :workers, types[Types::WorkerType]
end
