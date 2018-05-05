Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :shufflePlayerOrder, Mutations::ShufflePlayerOrder.field
end
